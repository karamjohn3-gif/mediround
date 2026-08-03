import type { Metadata } from "next";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { ButtonLink } from "@/components/ui/Button";
import { EXAM_NAMES } from "@/lib/constants";
import { DeleteTopicButton } from "@/components/admin/DeleteTopicButton";
import { AdminNav } from "@/components/admin/AdminNav";

export const metadata: Metadata = { title: "Topics — MediRound" };

export default async function AdminTopicsPage() {
  const supabase = await createClient();
  const [{ data: topics }, { data: questions }] = await Promise.all([
    supabase.from("topics").select("*").order("exam").order("specialty"),
    supabase.from("questions").select("topic_id"),
  ]);

  const counts: Record<string, number> = {};
  for (const q of questions ?? []) {
    counts[q.topic_id] = (counts[q.topic_id] ?? 0) + 1;
  }

  return (
    <>
      <AdminNav active="topics" />
      <div className="flex flex-wrap items-center justify-between gap-4 mb-8">
        <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900)">Topics</h1>
        <ButtonLink href="/admin/topics/new" variant="accent">
          New topic
        </ButtonLink>
      </div>

      <div className="rounded-3xl border border-(--color-ink-100) overflow-hidden">
        <table className="w-full text-sm">
          <caption className="sr-only">All topics</caption>
          <thead className="bg-(--color-ink-50) text-left">
            <tr>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Topic
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Exam
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Specialty
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                Questions
              </th>
              <th scope="col" className="px-4 py-3 font-semibold text-(--color-ink-700)">
                <span className="sr-only">Actions</span>
              </th>
            </tr>
          </thead>
          <tbody>
            {(topics ?? []).map((t) => (
              <tr key={t.id} className="border-t border-(--color-ink-100)">
                <td className="px-4 py-3">
                  <Link
                    href={`/admin/topics/${t.id}`}
                    className="font-semibold text-(--color-navy-900) hover:underline"
                  >
                    {t.name}
                  </Link>
                </td>
                <td className="px-4 py-3 text-(--color-ink-700)">{EXAM_NAMES[t.exam]}</td>
                <td className="px-4 py-3 text-(--color-ink-700)">{t.specialty}</td>
                <td className="px-4 py-3 text-(--color-ink-700)">{counts[t.id] ?? 0}</td>
                <td className="px-4 py-3 text-right">
                  <DeleteTopicButton topicId={t.id} topicLabel={t.name} />
                </td>
              </tr>
            ))}
            {(topics ?? []).length === 0 && (
              <tr>
                <td colSpan={5} className="px-4 py-8 text-center text-(--color-ink-500)">
                  No topics yet.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
