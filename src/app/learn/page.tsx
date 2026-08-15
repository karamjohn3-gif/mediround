import type { Metadata } from "next";
import Link from "next/link";
import { EXAMS } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import { cn } from "@/lib/utils";

export const metadata: Metadata = { title: "Learn — MediRound" };

export default async function LearnPage() {
  const supabase = await createClient();
  const { data: chapters } = await supabase
    .from("chapters")
    .select("exam")
    .eq("status", "published");

  const counts: Record<string, number> = {};
  for (const c of chapters ?? []) {
    counts[c.exam] = (counts[c.exam] ?? 0) + 1;
  }

  return (
    <div className="mx-auto max-w-5xl px-4 sm:px-6 py-12 sm:py-16 w-full">
      <p className="text-sm font-semibold text-(--color-teal-700) mb-2">Learn</p>
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900)">
        Reference chapters, alongside your questions
      </h1>
      <p className="text-(--color-ink-500) mt-2 max-w-xl">
        Definition, aetiology, pathophysiology, investigations and management for every condition
        in the question bank, organised the same way the curriculum tests it.
      </p>
      <div
        className={cn(
          "grid gap-5 mt-8",
          EXAMS.length >= 3 ? "sm:grid-cols-3" : "sm:grid-cols-2"
        )}
      >
        {EXAMS.map((exam) => {
          const count = counts[exam.id] ?? 0;
          const available = count > 0;
          const content = (
            <>
              <div>
                <p className="font-display text-lg font-bold text-(--color-ink-900)">
                  {exam.name}
                </p>
                <p className="text-sm text-(--color-ink-500) mt-1">{exam.fullName}</p>
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
              key={exam.id}
              href={`/learn/${exam.id}`}
              className="flex flex-col justify-between rounded-2xl border border-(--color-ink-100) bg-white p-5 hover:border-(--color-teal-400) hover:shadow-md hover:shadow-(--color-teal-100) transition-all duration-200"
            >
              {content}
            </Link>
          ) : (
            <div
              key={exam.id}
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
