import { DIFFICULTY_LABELS } from "@/lib/constants";
import type { QuestionDifficulty } from "@/lib/types/database";

export function QuestionVignette({
  stem,
  leadIn,
  topicName,
  difficulty,
  questionNumber,
  totalQuestions,
}: {
  stem: string;
  leadIn: string;
  topicName: string;
  difficulty: QuestionDifficulty;
  questionNumber: number;
  totalQuestions: number;
}) {
  return (
    <div>
      <div className="flex items-center justify-between text-sm mb-3">
        <span className="font-semibold text-(--color-ink-500)">
          Question {questionNumber} of {totalQuestions}
        </span>
        <div className="flex items-center gap-2">
          <span className="rounded-full bg-(--color-navy-50) text-(--color-navy-800) px-2.5 py-1 text-xs font-semibold">
            {topicName}
          </span>
          <span className="rounded-full bg-(--color-ink-100) text-(--color-ink-700) px-2.5 py-1 text-xs font-semibold">
            {DIFFICULTY_LABELS[difficulty]}
          </span>
        </div>
      </div>
      <div
        className="rounded-2xl border border-(--color-ink-100) bg-white p-5 sm:p-6 whitespace-pre-line leading-relaxed text-(--color-ink-900)"
      >
        {stem}
      </div>
      <p className="font-display font-bold text-lg text-(--color-ink-900) mt-4">{leadIn}</p>
    </div>
  );
}
