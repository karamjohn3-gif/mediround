import { notFound } from "next/navigation";
import Link from "next/link";
import type { Metadata } from "next";
import { EXAMS, EXAM_NAMES } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import type { ExamType } from "@/lib/types/database";
import { TopicCard } from "@/components/practice/TopicCard";
import { cn } from "@/lib/utils";

type Params = { exam: string };

function isExamType(value: string): value is ExamType {
  return EXAMS.some((e) => e.id === value);
}

export async function generateMetadata({
  params,
}: {
  params: Promise<Params>;
}): Promise<Metadata> {
  const { exam } = await params;
  return { title: isExamType(exam) ? `${EXAM_NAMES[exam]} — MediRound` : "Practice — MediRound" };
}

export default async function ExamTopicsPage({ params }: { params: Promise<Params> }) {
  const { exam } = await params;
  if (!isExamType(exam)) notFound();

  const supabase = await createClient();
  const [{ data: topics }, { data: questions }] = await Promise.all([
    supabase.from("topics").select("*").eq("exam", exam).order("specialty"),
    supabase.from("questions").select("topic_id").eq("exam", exam).eq("status", "published"),
  ]);

  const counts: Record<string, number> = {};
  for (const q of questions ?? []) {
    counts[q.topic_id] = (counts[q.topic_id] ?? 0) + 1;
  }
  const totalQuestions = questions?.length ?? 0;

  return (
    <div className="mx-auto max-w-5xl px-4 sm:px-6 py-12 sm:py-16 w-full">
      <p className="text-sm font-semibold text-(--color-teal-700) mb-2">{EXAM_NAMES[exam]}</p>
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900)">
        Choose a topic
      </h1>
      <p className="text-(--color-ink-500) mt-2 max-w-xl">
        Or mix everything together in one session.
      </p>

      <Link
        href={totalQuestions > 0 ? `/practice/${exam}/session?topic=all` : "#"}
        aria-disabled={totalQuestions === 0}
        className={cn(
          "mt-6 inline-flex items-center gap-2 rounded-full px-6 py-3 font-semibold transition-colors",
          totalQuestions > 0
            ? "bg-(--color-navy-900) text-white hover:bg-(--color-navy-800)"
            : "bg-(--color-ink-100) text-(--color-ink-300) pointer-events-none"
        )}
      >
        Start a mixed session · {totalQuestions} question{totalQuestions === 1 ? "" : "s"}
      </Link>

      <div className="grid sm:grid-cols-2 gap-4 mt-8">
        {(topics ?? []).map((topic) => (
          <TopicCard key={topic.id} topic={topic} questionCount={counts[topic.id] ?? 0} examId={exam} />
        ))}
      </div>
    </div>
  );
}
