import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { QuestionForm, type QuestionFormInitial } from "@/components/admin/QuestionForm";

export const metadata: Metadata = { title: "Edit question — MediRound" };

export default async function EditQuestionPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const [{ data: topics }, { data: question }] = await Promise.all([
    supabase.from("topics").select("id, exam, specialty, name").order("specialty"),
    supabase
      .from("questions")
      .select(
        "id, exam, topic_id, difficulty, status, stem, lead_in, tags, options:question_options(label, option_text, rationale, is_correct, sort_order), discriminators:question_discriminators(discriminator_text, sort_order)"
      )
      .eq("id", id)
      .single(),
  ]);

  if (!question) notFound();

  const initial: QuestionFormInitial = {
    id: question.id,
    exam: question.exam,
    topicId: question.topic_id,
    difficulty: question.difficulty,
    status: question.status,
    stem: question.stem,
    leadIn: question.lead_in,
    tags: question.tags,
    options: [...question.options]
      .sort((a, b) => a.sort_order - b.sort_order)
      .map((o) => ({
        label: o.label,
        text: o.option_text,
        rationale: o.rationale,
        isCorrect: o.is_correct,
      })),
    discriminators: [...question.discriminators]
      .sort((a, b) => a.sort_order - b.sort_order)
      .map((d) => d.discriminator_text),
  };

  return (
    <>
      <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900) mb-8">
        Edit question
      </h1>
      <QuestionForm topics={topics ?? []} initial={initial} />
    </>
  );
}
