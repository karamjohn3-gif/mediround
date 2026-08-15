import Link from "next/link";
import type { ExamType } from "@/lib/types/database";
import type { ChapterRow } from "@/lib/types/domain";

export function ChapterListItem({
  chapter,
  examId,
  topicSlug,
  questionCount,
}: {
  chapter: Pick<ChapterRow, "title" | "slug" | "dek">;
  examId: ExamType;
  topicSlug: string;
  questionCount: number;
}) {
  return (
    <Link
      href={`/learn/${examId}/${topicSlug}/${chapter.slug}`}
      className="flex items-center gap-3.5 border-b border-(--color-ink-100) last:border-b-0 px-4 py-3.5 hover:bg-(--color-ink-50) transition-colors"
    >
      <div className="flex-1 min-w-0">
        <p className="font-bold text-sm text-(--color-ink-900)">{chapter.title}</p>
        <p className="text-xs text-(--color-ink-500) mt-0.5 line-clamp-1">{chapter.dek}</p>
      </div>
      <span className="text-[11px] font-extrabold text-(--color-teal-700) bg-(--color-teal-50) border border-(--color-teal-100) px-2 py-0.5 rounded-full whitespace-nowrap tabular-nums">
        {questionCount} Q{questionCount === 1 ? "" : "s"}
      </span>
      <span className="text-(--color-ink-200) text-base" aria-hidden="true">
        &rsaquo;
      </span>
    </Link>
  );
}
