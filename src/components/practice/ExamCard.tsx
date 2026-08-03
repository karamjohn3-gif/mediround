import Link from "next/link";
import { ArrowRight } from "@phosphor-icons/react/dist/ssr/ArrowRight";

export function ExamCard({
  exam,
  questionCount,
}: {
  exam: { id: string; name: string; fullName: string };
  questionCount: number;
}) {
  return (
    <Link
      href={`/practice/${exam.id}`}
      className="group flex flex-col justify-between rounded-3xl border border-(--color-ink-100) bg-white p-6 hover:border-(--color-teal-400) hover:shadow-lg hover:shadow-(--color-teal-100) transition-all duration-200"
    >
      <div>
        <p className="font-display text-2xl font-extrabold text-(--color-navy-900)">
          {exam.name}
        </p>
        <p className="text-(--color-ink-500) mt-1 text-sm">{exam.fullName}</p>
      </div>
      <div className="flex items-center justify-between mt-8">
        <span className="text-sm font-semibold text-(--color-ink-500)">
          {questionCount} question{questionCount === 1 ? "" : "s"}
        </span>
        <span className="inline-flex items-center justify-center w-9 h-9 rounded-full bg-(--color-teal-50) text-(--color-teal-600) group-hover:bg-(--color-teal-600) group-hover:text-white transition-colors">
          <ArrowRight size={18} weight="bold" aria-hidden="true" />
        </span>
      </div>
    </Link>
  );
}
