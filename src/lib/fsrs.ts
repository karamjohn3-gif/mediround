import { createEmptyCard, fsrs, Rating, type Card, type Grade } from "ts-fsrs";
import type { ConfidenceLevel } from "@/lib/types/database";
import type { FsrsStateRow } from "@/lib/types/domain";

const scheduler = fsrs({ request_retention: 0.9, enable_fuzz: true });

export function rowToCard(row: FsrsStateRow | null): Card {
  if (!row) return createEmptyCard();
  return {
    due: new Date(row.due),
    stability: row.stability,
    difficulty: row.difficulty,
    elapsed_days: row.elapsed_days,
    scheduled_days: row.scheduled_days,
    learning_steps: row.learning_steps,
    reps: row.reps,
    lapses: row.lapses,
    state: row.state,
    last_review: row.last_review ? new Date(row.last_review) : undefined,
  };
}

export function cardToRowPatch(card: Card) {
  return {
    due: card.due.toISOString(),
    stability: card.stability,
    difficulty: card.difficulty,
    elapsed_days: card.elapsed_days,
    scheduled_days: card.scheduled_days,
    learning_steps: card.learning_steps,
    reps: card.reps,
    lapses: card.lapses,
    state: card.state as number,
    last_review: card.last_review ? card.last_review.toISOString() : null,
  };
}

/**
 * We don't make users separately self-rate recall difficulty
 * (Again/Hard/Good/Easy, the usual Anki-style flashcard rating) — that
 * would duplicate the confidence level and correctness we already capture
 * per attempt. Instead we derive the FSRS rating from both: wrong answers
 * are always "Again"; correct answers scale from "Hard" (answered while
 * guessing) to "Easy" (answered while certain). Stating a confidence level
 * is optional, so a correct answer with no confidence given falls back to
 * "Good" — a neutral middle rating rather than guessing at either extreme.
 */
export function ratingFromAttempt(isCorrect: boolean, confidence: ConfidenceLevel | null): Grade {
  if (!isCorrect) return Rating.Again;
  if (confidence === "guessing") return Rating.Hard;
  if (confidence === "certain") return Rating.Easy;
  return Rating.Good;
}

export function scheduleNext(
  previous: Card,
  isCorrect: boolean,
  confidence: ConfidenceLevel | null,
  now: Date = new Date()
): Card {
  const rating = ratingFromAttempt(isCorrect, confidence);
  return scheduler.next(previous, now, rating).card;
}
