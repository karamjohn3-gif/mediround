import { notFound } from "next/navigation";
import Link from "next/link";
import type { Metadata } from "next";
import { EXAMS, EXAM_NAMES } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import type { ExamType } from "@/lib/types/database";
import { ChapterToc, ChapterBody } from "@/components/learn/ChapterBody";
import { ButtonLink } from "@/components/ui/Button";

type Params = { exam: string; topicSlug: string; chapterSlug: string };

function isExamType(value: string): value is ExamType {
  return EXAMS.some((e) => e.id === value);
}

export async function generateMetadata({
  params,
}: {
  params: Promise<Params>;
}): Promise<Metadata> {
  const { exam, topicSlug, chapterSlug } = await params;
  if (!isExamType(exam)) return { title: "Learn" };
  const supabase = await createClient();
  const { data: topic } = await supabase
    .from("topics")
    .select("id")
    .eq("exam", exam)
    .eq("slug", topicSlug)
    .single();
  if (!topic) return { title: "Learn" };
  const { data: chapter } = await supabase
    .from("chapters")
    .select("title")
    .eq("topic_id", topic.id)
    .eq("slug", chapterSlug)
    .single();
  return { title: chapter ? `${chapter.title} — Learn — MediRound` : "Learn" };
}

export default async function LearnChapterPage({ params }: { params: Promise<Params> }) {
  const { exam, topicSlug, chapterSlug } = await params;
  if (!isExamType(exam)) notFound();

  const supabase = await createClient();
  const { data: topic } = await supabase
    .from("topics")
    .select("*")
    .eq("exam", exam)
    .eq("slug", topicSlug)
    .single();
  if (!topic) notFound();

  const [{ data: chapter }, { data: siblings }, { count: questionCount }] = await Promise.all([
    supabase
      .from("chapters")
      .select("*")
      .eq("topic_id", topic.id)
      .eq("slug", chapterSlug)
      .eq("status", "published")
      .single(),
    supabase
      .from("chapters")
      .select("title, slug")
      .eq("topic_id", topic.id)
      .eq("status", "published")
      .order("sort_order"),
    supabase
      .from("questions")
      .select("id", { count: "exact", head: true })
      .eq("topic_id", topic.id)
      .eq("status", "published"),
  ]);
  if (!chapter) notFound();

  return (
    <div className="mx-auto max-w-6xl px-4 sm:px-6 py-10 sm:py-14 w-full">
      <p className="text-sm text-(--color-ink-500) flex items-center gap-1.5 flex-wrap mb-8">
        <Link href="/learn" className="hover:text-(--color-ink-900)">
          Learn
        </Link>
        <span className="text-(--color-ink-200)">/</span>
        <Link href={`/learn/${exam}`} className="hover:text-(--color-ink-900)">
          {EXAM_NAMES[exam]}
        </Link>
        <span className="text-(--color-ink-200)">/</span>
        <Link href={`/learn/${exam}/${topic.slug}`} className="hover:text-(--color-ink-900)">
          {topic.name}
        </Link>
        <span className="text-(--color-ink-200)">/</span>
        <span className="font-bold text-(--color-ink-900)">{chapter.title}</span>
      </p>

      <div className="grid lg:grid-cols-[200px_minmax(0,1fr)_260px] gap-9 items-start">
        <ChapterToc sections={chapter.sections} />

        <div>
          <div className="flex items-center gap-2 text-xs font-extrabold uppercase tracking-wide text-(--color-ink-500) mb-2.5">
            {topic.name}
            <span className="w-1 h-1 rounded-full bg-(--color-ink-300)" />
            Condition
            <span className="w-1 h-1 rounded-full bg-(--color-ink-300)" />
            <span className="normal-case font-bold text-[10.5px] px-2 py-0.5 rounded-full bg-(--color-navy-100) text-(--color-navy-700) tracking-normal">
              {chapter.tag}
            </span>
          </div>
          <h1 className="font-display text-3xl sm:text-[2rem] font-extrabold text-(--color-ink-900) mb-1.5 text-balance">
            {chapter.title}
          </h1>
          <p className="text-(--color-ink-500) text-base leading-relaxed max-w-[66ch] mb-9">
            {chapter.dek}
          </p>

          <ChapterBody sections={chapter.sections} pearls={chapter.pearls} />

          {chapter.refs.length > 0 && (
            <div className="mt-10 pt-4 border-t border-(--color-ink-100) max-w-[66ch]">
              <p className="text-[11px] font-extrabold uppercase tracking-wide text-(--color-ink-500) mb-2">
                Checked against
              </p>
              <ul className="text-xs text-(--color-ink-500) list-disc pl-4.5 space-y-1">
                {chapter.refs.map((r, i) => (
                  <li key={i}>
                    {r.label}. <em>{r.source}</em>.{" "}
                    <a
                      href={r.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-(--color-teal-700) hover:underline"
                    >
                      {r.url}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          )}
        </div>

        <aside className="sticky top-20 flex flex-col gap-3.5">
          <div className="rounded-2xl border border-(--color-ink-100) bg-white p-4.5">
            <h3 className="font-display text-[13px] font-extrabold text-(--color-ink-900) mb-1">
              Practice this specialty
            </h3>
            <p className="text-[11.5px] text-(--color-ink-500) mb-3.5 leading-snug">
              Linked at the specialty level, not yet per condition.
            </p>
            <div className="flex items-baseline gap-2 mb-3.5">
              <span className="font-display text-2xl font-extrabold tabular-nums">
                {questionCount ?? 0}
              </span>
              <span className="text-xs text-(--color-ink-500)">questions available</span>
            </div>
            <ButtonLink
              href={`/practice/${exam}/session?topic=${topic.id}`}
              variant="primary"
              size="sm"
              className="w-full justify-center"
            >
              Start a session →
            </ButtonLink>
          </div>

          {chapter.related_presentations.length > 0 && (
            <div className="rounded-2xl border border-(--color-ink-100) bg-white p-4.5">
              <h3 className="font-display text-[13px] font-extrabold text-(--color-ink-900) mb-1">
                Related presentations
              </h3>
              <p className="text-[11.5px] text-(--color-ink-500) mb-3 leading-snug">
                Where this condition shows up as a symptom
              </p>
              <div className="flex flex-wrap gap-1.5">
                {chapter.related_presentations.map((r) => (
                  <span
                    key={r}
                    className="text-[11.5px] font-semibold text-(--color-ink-500) bg-(--color-ink-50) border border-(--color-ink-100) px-2.5 py-1 rounded-full"
                  >
                    {r}
                  </span>
                ))}
              </div>
            </div>
          )}

          {(siblings ?? []).length > 1 && (
            <div className="rounded-2xl border border-(--color-ink-100) bg-white p-4.5">
              <h3 className="font-display text-[13px] font-extrabold text-(--color-ink-900) mb-1">
                All {topic.name} conditions
              </h3>
              <p className="text-[11.5px] text-(--color-ink-500) mb-2.5 leading-snug">
                Jump to another chapter
              </p>
              <div className="flex flex-col gap-0.5 max-h-[300px] overflow-y-auto">
                {(siblings ?? []).map((s) => (
                  <Link
                    key={s.slug}
                    href={`/learn/${exam}/${topic.slug}/${s.slug}`}
                    className={
                      s.slug === chapter.slug
                        ? "text-[12.5px] font-semibold px-2 py-1.5 rounded-lg text-(--color-teal-700) bg-(--color-teal-50)"
                        : "text-[12.5px] font-semibold px-2 py-1.5 rounded-lg text-(--color-ink-500) hover:bg-(--color-ink-50) hover:text-(--color-ink-900)"
                    }
                  >
                    {s.title}
                  </Link>
                ))}
              </div>
            </div>
          )}
        </aside>
      </div>
    </div>
  );
}
