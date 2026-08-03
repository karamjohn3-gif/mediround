import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { QuestionForm } from "@/components/admin/QuestionForm";

export const metadata: Metadata = { title: "New question — MediRound" };

export default async function NewQuestionPage() {
  const supabase = await createClient();
  const { data: topics } = await supabase
    .from("topics")
    .select("id, exam, specialty, name")
    .order("specialty");

  return (
    <>
      <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900) mb-8">
        New question
      </h1>
      <QuestionForm topics={topics ?? []} />
    </>
  );
}
