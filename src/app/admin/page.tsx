import type { Metadata } from "next";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { ButtonLink } from "@/components/ui/Button";
import { EXAM_NAMES, DIFFICULTY_LABELS } from "@/lib/constants";
import { DeleteQuestionButton } from "@/components/admin/DeleteQuestionButton";
import { AdminNav } from "@/components/admin/AdminNav";

export const metadata: Metadata = { title: "Admin — MediRound" };

export default async function AdminPage() {
  const supabase = await createClient();
  const { data: questions } = await supabase
    .from("questions")
    .select("id, exam, status, difficulty, lead_in, topic:topics(name)")
    .order("created_at", { ascending: false });

  return (
    <>
      <AdminNav active="questions" />
      <div className="flex flex-wrap items-center justify-between gap-4 mb-8">
        <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900)">
          Question bank
        </h1>
        <ButtonLink href="/admin/questions/new" variant="accent">
          New question
        </ButtonLink>
      </div>

      <div className="rounded-3xl border border-(--color-ink-100) overflow-hidden">
        <table className="w-full text-sm">
          <caption className="sr-only">All authored questions</caption>
          <thead className="bg-(--color-ink-50) text-left">
            <tr>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Question
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Exam
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Topic
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Difficulty
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Status
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                <span className="sr-only">Actions</span>
              </th>
            </tr>
          </thead>
          <tbody>
            {(questions ?? []).map((q) => (
              <tr key={q.id} className="border-t border-(--color-ink-100)">
                <td className="px-4 py-3 max-w-xs">
                  <Link
                    href={`/admin/questions/${q.id}`}
                    className="font-semibold text-(--color-navy-900) hover:underline line-clamp-1"
                  >
                    {q.lead_in}
                  </Link>
                </td>
                <td className="px-4 py-3 text-(--color-ink-700)">{EXAM_NAMES[q.exam]}</td>
                <td className="px-4 py-3 text-(--color-ink-700)">{q.topic?.name ?? "—"}</td>
                <td className="px-4 py-3 text-(--color-ink-700)">
                  {DIFFICULTY_LABELS[q.difficulty]}
                </td>
                <td className="px-4 py-3">
                  <span
                    className={
                      q.status === "published"
                        ? "rounded-full bg-(--color-success-50) text-(--color-success-700) text-xs font-semibold px-2.5 py-1"
                        : "rounded-full bg-(--color-warning-50) text-(--color-warning-700) text-xs font-semibold px-2.5 py-1"
                    }
                  >
                    {q.status}
                  </span>
                </td>
                <td className="px-4 py-3 text-right">
                  <DeleteQuestionButton questionId={q.id} questionLabel={q.lead_in} />
                </td>
              </tr>
            ))}
            {(questions ?? []).length === 0 && (
              <tr>
                <td colSpan={6} className="px-4 py-8 text-center text-(--color-ink-500)">
                  No questions yet.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
