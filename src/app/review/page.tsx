import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import type { PracticeQuestion } from "@/lib/types/domain";
import { SessionRunner } from "@/components/practice/SessionRunner";
import { ButtonLink } from "@/components/ui/Button";
import { FREE_ATTEMPT_LIMIT } from "@/lib/constants";
import { UpgradePrompt } from "@/components/practice/UpgradePrompt";

export const metadata: Metadata = { title: "Review queue — MediRound" };

const REVIEW_SESSION_SIZE = 20;

function shuffle<T>(items: T[]): T[] {
  const arr = [...items];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

export default async function ReviewPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null; // unreachable — proxy.ts gates this route

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
          <UpgradePrompt heading="Upgrade to unlock spaced-repetition review" />
        </div>
      );
    }
  }

  const nowIso = new Date().toISOString();

  const { data: dueRows } = await supabase
    .from("fsrs_state")
    .select(
      "due, question:questions(id, exam, topic_id, difficulty, stem, lead_in, tags, topic:topics(id,name,specialty), options:question_options_public(id,question_id,label,option_text,sort_order))"
    )
    .eq("user_id", user.id)
    .lte("due", nowIso)
    .order("due", { ascending: true })
    .limit(REVIEW_SESSION_SIZE);

  const { count: upcomingCount } = await supabase
    .from("fsrs_state")
    .select("id", { count: "exact", head: true })
    .eq("user_id", user.id)
    .gt("due", nowIso);

  const questions: PracticeQuestion[] = shuffle(
    (dueRows ?? [])
      .filter((r) => r.question)
      .map((r) => ({
        ...r.question!,
        // Shuffle display order (rather than sorting by stored sort_order) so
        // the correct answer's position varies — most authored questions
        // place it first in storage, which would otherwise make it guessable.
        options: shuffle(r.question!.options).map((opt, i) => ({
          ...opt,
          label: String.fromCharCode(65 + i) as typeof opt.label,
        })),
      }))
  );

  if (questions.length === 0) {
    return (
      <div className="mx-auto max-w-lg px-4 sm:px-6 py-16 sm:py-24 w-full text-center">
        <h1 className="font-display text-2xl font-bold text-(--color-ink-900)">
          You&rsquo;re all caught up
        </h1>
        <p className="text-(--color-ink-500) mt-2">
          {upcomingCount && upcomingCount > 0
            ? `${upcomingCount} question${upcomingCount === 1 ? " is" : "s are"} scheduled for later, based on how you answered them.`
            : "Answer some questions in practice mode and they'll be scheduled here for review."}
        </p>
        <ButtonLink href="/practice" variant="accent" size="lg" className="mt-6">
          Go to practice
        </ButtonLink>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-3xl px-4 sm:px-6 py-8 sm:py-12 w-full">
      <SessionRunner questions={questions} examName="Review queue" mode="review" />
    </div>
  );
}
