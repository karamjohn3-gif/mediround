import type { Metadata } from "next";
import { EXAMS } from "@/lib/constants";
import { ExamCard } from "@/components/practice/ExamCard";
import { createClient } from "@/lib/supabase/server";
import { cn } from "@/lib/utils";

export const metadata: Metadata = { title: "Practice — MediRound" };

export default async function PracticePage() {
  const supabase = await createClient();
  const { data: questions } = await supabase
    .from("questions")
    .select("exam")
    .eq("status", "published");

  const counts: Record<string, number> = {};
  for (const q of questions ?? []) {
    counts[q.exam] = (counts[q.exam] ?? 0) + 1;
  }

  return (
    <div className="mx-auto max-w-5xl px-4 sm:px-6 py-12 sm:py-16 w-full">
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900)">
        Choose your exam
      </h1>
      <p className="text-(--color-ink-500) mt-2 max-w-xl">
        Pick the exam you&rsquo;re preparing for. Every question is built to teach you the
        reasoning behind the answer, not just mark it right or wrong.
      </p>
      <div
        className={cn(
          "grid gap-5 mt-8",
          // Keep the grid honest to however many exams actually exist,
          // instead of leaving a dangling empty column when one is removed.
          EXAMS.length >= 3 ? "sm:grid-cols-3" : "sm:grid-cols-2"
        )}
      >
        {EXAMS.map((exam) => (
          <ExamCard key={exam.id} exam={exam} questionCount={counts[exam.id] ?? 0} />
        ))}
      </div>
    </div>
  );
}
