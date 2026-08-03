import { ButtonLink } from "@/components/ui/Button";
import { CONFIDENCE_LEVELS } from "@/lib/constants";
import type { ConfidenceLevel } from "@/lib/types/database";

export interface SessionAttemptRecord {
  isCorrect: boolean;
  confidence: ConfidenceLevel | null;
}

export function SessionSummary({
  attempts,
  primaryAction,
}: {
  attempts: SessionAttemptRecord[];
  /** Where "practice/review again" should send them — differs for a
   * topic-scoped practice session vs. the mixed-exam review queue. */
  primaryAction: { href: string; label: string };
}) {
  const total = attempts.length;
  const correct = attempts.filter((a) => a.isCorrect).length;
  const accuracy = total > 0 ? Math.round((correct / total) * 100) : 0;

  return (
    <div className="mx-auto max-w-lg text-center py-8">
      <p className="text-sm font-semibold text-(--color-teal-700) uppercase tracking-wide">
        Session complete
      </p>
      <p className="font-display text-5xl font-extrabold text-(--color-navy-900) mt-3">
        {accuracy}%
      </p>
      <p className="text-(--color-ink-500) mt-1">
        {correct} of {total} correct
      </p>

      <div className="grid grid-cols-3 gap-3 mt-8 text-left">
        {CONFIDENCE_LEVELS.map((level) => {
          const inLevel = attempts.filter((a) => a.confidence === level.id);
          const levelCorrect = inLevel.filter((a) => a.isCorrect).length;
          const levelAccuracy =
            inLevel.length > 0 ? Math.round((levelCorrect / inLevel.length) * 100) : null;
          return (
            <div key={level.id} className="rounded-2xl border border-(--color-ink-100) p-3.5">
              <p className="text-xs font-semibold text-(--color-ink-500)">{level.label}</p>
              <p className="font-display text-xl font-bold text-(--color-ink-900) mt-1">
                {levelAccuracy === null ? "—" : `${levelAccuracy}%`}
              </p>
              <p className="text-xs text-(--color-ink-500) mt-0.5">{inLevel.length} answered</p>
            </div>
          );
        })}
      </div>

      {(() => {
        const unstated = attempts.filter((a) => !a.confidence).length;
        return unstated > 0 ? (
          <p className="text-xs text-(--color-ink-500) mt-3">
            {unstated} of {total} answered without stating a confidence level.
          </p>
        ) : null;
      })()}

      <div className="flex flex-wrap items-center justify-center gap-3 mt-8">
        <ButtonLink href={primaryAction.href} variant="outline">
          {primaryAction.label}
        </ButtonLink>
        <ButtonLink href="/dashboard" variant="primary">
          View your dashboard
        </ButtonLink>
      </div>
    </div>
  );
}
