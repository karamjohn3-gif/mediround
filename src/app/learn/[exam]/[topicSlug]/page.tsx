import { notFound } from "next/navigation";
import Link from "next/link";
import type { Metadata } from "next";
import { EXAMS, EXAM_NAMES } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import type { ExamType } from "@/lib/types/database";
import { ChapterListItem } from "@/components/learn/ChapterListItem";

type Params = { exam: string; topicSlug: string };

function isExamType(value: string): value is ExamType {
  return EXAMS.some((e) => e.id === value);
}

export async function generateMetadata({
  params,
}: {
  params: Promise<Params>;
}): Promise<Metadata> {
  const { exam, topicSlug } = await params;
  if (!isExamType(exam)) return { title: "Learn" };
  const supabase = await createClient();
  const { data: topic } = await supabase
    .from("topics")
    .select("name")
    .eq("exam", exam)
    .eq("slug", topicSlug)
    .single();
  return { title: topic ? `${topic.name} — Learn — MediRound` : "Learn" };
}

export default async function LearnTopicPage({ params }: { params: Promise<Params> }) {
  const { exam, topicSlug } = await params;
  if (!isExamType(exam)) notFound();

  const supabase = await createClient();
  const { data: topic } = await supabase
    .from("topics")
    .select("*")
    .eq("exam", exam)
    .eq("slug", topicSlug)
    .single();
  if (!topic) notFound();

  const [{ data: chapters }, { count: questionCount }] = await Promise.all([
    supabase
      .from("chapters")
      .select("title, slug, dek")
      .eq("topic_id", topic.id)
      .eq("status", "published")
      .order("sort_order"),
    supabase
      .from("questions")
      .select("id", { count: "exact", head: true })
      .eq("topic_id", topic.id)
      .eq("status", "published"),
  ]);

  return (
    <div className="mx-auto max-w-4xl px-4 sm:px-6 py-10 sm:py-14 w-full">
      <p className="text-sm text-(--color-ink-500) flex items-center gap-1.5 flex-wrap">
        <Link href="/learn" className="hover:text-(--color-ink-900)">
          Learn
        </Link>
        <span className="text-(--color-ink-200)">/</span>
        <Link href={`/learn/${exam}`} className="hover:text-(--color-ink-900)">
          {EXAM_NAMES[exam]}
        </Link>
        <span className="text-(--color-ink-200)">/</span>
        <span className="font-bold text-(--color-ink-900)">{topic.name}</span>
      </p>

      <p className="text-xs font-extrabold uppercase tracking-wide text-(--color-teal-700) mt-6">
        System / specialty
      </p>
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900) mt-1">
        {topic.name}
      </h1>

      <div className="flex gap-2.5 mt-5 flex-wrap">
        <div className="flex items-baseline gap-1.5 bg-white border border-(--color-ink-100) rounded-xl px-3.5 py-2">
          <span className="font-display text-base font-extrabold tabular-nums">
            {chapters?.length ?? 0}
          </span>
          <span className="text-xs text-(--color-ink-500)">chapters</span>
        </div>
        <div className="flex items-baseline gap-1.5 bg-white border border-(--color-ink-100) rounded-xl px-3.5 py-2">
          <span className="font-display text-base font-extrabold tabular-nums">
            {questionCount ?? 0}
          </span>
          <span className="text-xs text-(--color-ink-500)">linked practice questions</span>
        </div>
      </div>

      <div className="rounded-2xl border border-(--color-ink-100) bg-white overflow-hidden mt-8">
        <div className="px-5 py-4 border-b border-(--color-ink-100)">
          <h2 className="font-display text-sm font-extrabold text-(--color-ink-900)">
            Conditions
          </h2>
          <p className="text-xs text-(--color-ink-500) mt-0.5">
            Full chapters, mechanism through to management
          </p>
        </div>
        <div>
          {(chapters ?? []).length === 0 ? (
            <p className="px-5 py-6 text-sm text-(--color-ink-500)">
              No chapters published for this specialty yet.
            </p>
          ) : (
            (chapters ?? []).map((c) => (
              <ChapterListItem
                key={c.slug}
                chapter={c}
                examId={exam}
                topicSlug={topic.slug}
                questionCount={questionCount ?? 0}
              />
            ))
          )}
        </div>
      </div>
    </div>
  );
}
