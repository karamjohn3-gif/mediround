import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { EXAMS, EXAM_NAMES, FREE_ATTEMPT_LIMIT } from "@/lib/constants";
import { createClient } from "@/lib/supabase/server";
import type { ExamType } from "@/lib/types/database";
import type { PracticeQuestion } from "@/lib/types/domain";
import { UpgradePrompt } from "@/components/practice/UpgradePrompt";
import { SessionRunner } from "@/components/practice/SessionRunner";

type Params = { exam: string };
type SearchParams = { topic?: string };

function isExamType(value: string): value is ExamType {
  return EXAMS.some((e) => e.id === value);
}

function shuffle<T>(items: T[]): T[] {
  const arr = [...items];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

export async function generateMetadata({
  params,
}: {
  params: Promise<Params>;
}): Promise<Metadata> {
  const { exam } = await params;
  return {
    title: isExamType(exam) ? `Practice session — ${EXAM_NAMES[exam]} — MediRound` : "Practice",
  };
}

const SESSION_SIZE = 20;

export default async function SessionPage({
  params,
  searchParams,
}: {
  params: Promise<Params>;
  searchParams: Promise<SearchParams>;
}) {
  const { exam } = await params;
  const { topic } = await searchParams;
  if (!isExamType(exam)) notFound();

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) notFound(); // unreachable: proxy.ts already gates /practice, guard for type-safety

  const { data: profile } = await supabase
    .from("profiles")
    .select("subscription_status")
    .eq("id", user.id)
    .single();

  if (profile?.subscription_status !== "active") {
    const { count } = await supabase
      .from("attempts")
      .select("id", { count: "exact", head: true })
      .eq("user_id", user.id);

    if ((count ?? 0) >= FREE_ATTEMPT_LIMIT) {
      return (
        <div className="mx-auto max-w-5xl px-4 sm:px-6 py-16 sm:py-24 w-full flex justify-center">
          <UpgradePrompt />
        </div>
      );
    }
  }

  let query = supabase
    .from("questions")
    .select(
      "id, exam, topic_id, difficulty, stem, lead_in, tags, topic:topics(id,name,specialty), options:question_options_public(id,question_id,label,option_text,sort_order)"
    )
    .eq("exam", exam)
    .eq("status", "published")
    .limit(SESSION_SIZE);

  if (topic && topic !== "all") {
    query = query.eq("topic_id", topic);
  }

  const { data: rawQuestions, error } = await query;

  if (error || !rawQuestions || rawQuestions.length === 0) {
    return (
      <div className="mx-auto max-w-2xl px-4 sm:px-6 py-16 sm:py-24 w-full text-center">
        <h1 className="font-display text-2xl font-bold text-(--color-ink-900)">
          No questions available yet
        </h1>
        <p className="text-(--color-ink-500) mt-2">
          Try a different topic, or check back soon — we&rsquo;re adding questions regularly.
        </p>
      </div>
    );
  }

  const questions: PracticeQuestion[] = shuffle(rawQuestions).map((q) => ({
    ...q,
    // Shuffle display order (rather than sorting by stored sort_order) so the
    // correct answer's position varies — most authored questions place it
    // first in storage, which would otherwise make it guessable.
    options: shuffle(q.options).map((opt, i) => ({
      ...opt,
      label: String.fromCharCode(65 + i) as typeof opt.label,
    })),
  }));

  return (
    <div className="mx-auto max-w-3xl px-4 sm:px-6 py-8 sm:py-12 w-full">
      <SessionRunner questions={questions} examName={EXAM_NAMES[exam]} />
    </div>
  );
}
