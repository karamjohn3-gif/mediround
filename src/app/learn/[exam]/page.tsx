import { notFound } from "next/navigation";
import Link from "next/link";
import type { Metadata } from "next";
import { EXAMS, EXAM_NAMES } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import type { ExamType } from "@/lib/types/database";
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
  return { title: isExamType(exam) ? `Learn — ${EXAM_NAMES[exam]} — MediRound` : "Learn" };
}

export default async function LearnExamPage({ params }: { params: Promise<Params> }) {
  const { exam } = await params;
  if (!isExamType(exam)) notFound();

  const supabase = await createClient();
  const [{ data: topics }, { data: chapters }] = await Promise.all([
    supabase.from("topics").select("*").eq("exam", exam).order("specialty"),
    supabase.from("chapters").select("topic_id").eq("exam", exam).eq("status", "published"),
  ]);

  const counts: Record<string, number> = {};
  for (const c of chapters ?? []) {
    counts[c.topic_id] = (counts[c.topic_id] ?? 0) + 1;
  }

  return (
    <div className="mx-auto max-w-5xl px-4 sm:px-6 py-12 sm:py-16 w-full">
      <p className="text-sm font-semibold text-(--color-teal-700) mb-2">
        Learn · {EXAM_NAMES[exam]}
      </p>
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900)">
        Choose a specialty
      </h1>
      <p className="text-(--color-ink-500) mt-2 max-w-xl">
        Each specialty is organised by condition, mechanism through to management.
      </p>

      <div className="grid sm:grid-cols-2 gap-4 mt-8">
        {(topics ?? []).map((topic) => {
          const count = counts[topic.id] ?? 0;
          const available = count > 0;
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
                {available ? `${count} chapter${count === 1 ? "" : "s"}` : "Coming soon"}
              </p>
            </>
          );
          return available ? (
            <Link
              key={topic.id}
              href={`/learn/${exam}/${topic.slug}`}
              className="flex flex-col justify-between rounded-2xl border border-(--color-ink-100) bg-white p-5 hover:border-(--color-teal-400) hover:shadow-md hover:shadow-(--color-teal-100) transition-all duration-200"
            >
              {content}
            </Link>
          ) : (
            <div
              key={topic.id}
              aria-disabled="true"
              className="flex flex-col justify-between rounded-2xl border border-(--color-ink-100) bg-(--color-ink-50) p-5 opacity-60 cursor-not-allowed"
            >
              {content}
            </div>
          );
        })}
      </div>
    </div>
  );
}
