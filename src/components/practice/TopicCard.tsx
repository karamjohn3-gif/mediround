import Link from "next/link";
import { cn } from "@/lib/utils";
import type { ExamType } from "@/lib/types/database";
import type { TopicRow } from "@/lib/types/domain";

export function TopicCard({
  topic,
  questionCount,
  examId,
}: {
  topic: TopicRow;
  questionCount: number;
  examId: ExamType;
}) {
  const available = questionCount > 0;

  const content = (
    <>
      <div>
        <p className="text-xs font-semibold uppercase tracking-wide text-(--color-teal-700)">
          {topic.specialty}
        </p>
        <p className="font-display text-lg font-bold text-(--color-ink-900) mt-1">
          {topic.name}
        </p>
      </div>
      <p
        className={cn(
          "text-sm font-semibold mt-4",
          available ? "text-(--color-ink-500)" : "text-(--color-ink-300)"
        )}
      >
        {available ? `${questionCount} question${questionCount === 1 ? "" : "s"}` : "Coming soon"}
      </p>
    </>
  );

  if (!available) {
    return (
      <div
        aria-disabled="true"
        className="flex flex-col justify-between rounded-2xl border border-(--color-ink-100) bg-(--color-ink-50) p-5 opacity-60 cursor-not-allowed"
      >
        {content}
      </div>
    );
  }

  return (
    <Link
      href={`/practice/${examId}/session?topic=${topic.id}`}
      className="flex flex-col justify-between rounded-2xl border border-(--color-ink-100) bg-white p-5 hover:border-(--color-teal-400) hover:shadow-md hover:shadow-(--color-teal-100) transition-all duration-200"
    >
      {content}
    </Link>
  );
}
