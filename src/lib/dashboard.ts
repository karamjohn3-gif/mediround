import { CONFIDENCE_LEVELS } from "@/lib/constants";
import type { ConfidenceLevel, ErrorType, ExamType } from "@/lib/types/database";

export interface DashboardAttempt {
  is_correct: boolean;
  confidence: ConfidenceLevel | null;
  error_type: ErrorType | null;
  created_at: string;
  exam: ExamType;
  specialty: string;
  topic_name: string;
}

export interface SpecialtyStat {
  specialty: string;
  total: number;
  correct: number;
  accuracy: number;
}

export function groupBySpecialty(attempts: DashboardAttempt[]): SpecialtyStat[] {
  const map = new Map<string, { total: number; correct: number }>();
  for (const a of attempts) {
    const entry = map.get(a.specialty) ?? { total: 0, correct: 0 };
    entry.total += 1;
    if (a.is_correct) entry.correct += 1;
    map.set(a.specialty, entry);
  }
  return Array.from(map.entries())
    .map(([specialty, { total, correct }]) => ({
      specialty,
      total,
      correct,
      accuracy: total > 0 ? Math.round((correct / total) * 100) : 0,
    }))
    .sort((a, b) => a.accuracy - b.accuracy); // weakest first — most actionable
}

export interface CalibrationPoint {
  confidence: ConfidenceLevel;
  label: string;
  statedPercent: number;
  actualPercent: number | null;
  count: number;
}

export function computeCalibration(attempts: DashboardAttempt[]): CalibrationPoint[] {
  return CONFIDENCE_LEVELS.map((level) => {
    const inBucket = attempts.filter((a) => a.confidence === level.id);
    const correct = inBucket.filter((a) => a.is_correct).length;
    return {
      confidence: level.id,
      label: level.label,
      statedPercent: level.approxPercent,
      actualPercent: inBucket.length > 0 ? Math.round((correct / inBucket.length) * 100) : null,
      count: inBucket.length,
    };
  });
}

/** Longest run of consecutive calendar days (up to and including today or
 * yesterday) with at least one attempt. Uses the browser/server's local
 * calendar day boundaries via ISO date strings. */
export function computeStreak(attemptDates: string[], now: Date = new Date()): number {
  const days = new Set(attemptDates.map((d) => new Date(d).toDateString()));
  let streak = 0;
  const cursor = new Date(now);

  // If nothing happened today, the streak can still count through
  // yesterday (don't punish someone for not having practiced yet today).
  if (!days.has(cursor.toDateString())) {
    cursor.setDate(cursor.getDate() - 1);
  }

  while (days.has(cursor.toDateString())) {
    streak += 1;
    cursor.setDate(cursor.getDate() - 1);
  }

  return streak;
}

export interface ErrorTypeStat {
  errorType: ErrorType;
  count: number;
}

export function groupByErrorType(attempts: DashboardAttempt[]): ErrorTypeStat[] {
  const map = new Map<ErrorType, number>();
  for (const a of attempts) {
    if (a.error_type) map.set(a.error_type, (map.get(a.error_type) ?? 0) + 1);
  }
  return Array.from(map.entries())
    .map(([errorType, count]) => ({ errorType, count }))
    .sort((a, b) => b.count - a.count);
}

/**
 * A transparent, explainable heuristic — NOT a validated psychometric
 * prediction. Combines three factors, each 0-1:
 *  - accuracy: raw proportion correct
 *  - calibration: how close stated confidence tracks actual accuracy
 *    (penalises over/under-confidence, not just being wrong)
 *  - coverage: practice volume vs. a reasonable target (200 questions),
 *    since a 90% accuracy score from 5 questions means far less than
 *    from 500.
 * Weighted average, scaled to 0-100. Always surface this as an estimate.
 */
export function computeReadinessScore(attempts: DashboardAttempt[]): number | null {
  if (attempts.length === 0) return null;

  const accuracy = attempts.filter((a) => a.is_correct).length / attempts.length;

  const calibration = computeCalibration(attempts).filter((c) => c.actualPercent !== null);
  const calibrationError =
    calibration.length > 0
      ? calibration.reduce(
          (sum, c) => sum + Math.abs(c.statedPercent - (c.actualPercent as number)),
          0
        ) /
        calibration.length /
        100
      : 0.3; // no calibration data yet — assume middling
  const calibrationScore = Math.max(0, 1 - calibrationError);

  const coverage = Math.min(1, attempts.length / 200);

  const weighted = accuracy * 0.55 + calibrationScore * 0.2 + coverage * 0.25;
  return Math.round(weighted * 100);
}

export const READINESS_TARGET_QUESTIONS = 200;
