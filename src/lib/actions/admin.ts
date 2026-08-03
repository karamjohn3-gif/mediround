"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import type {
  ExamType,
  QuestionDifficulty,
  QuestionStatus,
} from "@/lib/types/database";

export type QuestionFormState = { error: string | null };

interface OptionInput {
  label: "A" | "B" | "C" | "D" | "E";
  text: string;
  rationale: string;
}

function parseOptions(formData: FormData): OptionInput[] {
  return (["A", "B", "C", "D", "E"] as const).map((label) => ({
    label,
    text: String(formData.get(`option_text_${label}`) ?? "").trim(),
    rationale: String(formData.get(`option_rationale_${label}`) ?? "").trim(),
  }));
}

function parseDiscriminators(formData: FormData): string[] {
  return formData
    .getAll("discriminator")
    .map((d) => String(d).trim())
    .filter((d) => d.length > 0);
}

export async function saveQuestionAction(
  _prevState: QuestionFormState,
  formData: FormData
): Promise<QuestionFormState> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return { error: "Not signed in." };

  const questionId = String(formData.get("questionId") ?? "").trim() || null;
  const exam = String(formData.get("exam") ?? "") as ExamType;
  const topicId = String(formData.get("topicId") ?? "").trim();
  const difficulty = String(formData.get("difficulty") ?? "core") as QuestionDifficulty;
  const status = String(formData.get("status") ?? "draft") as QuestionStatus;
  const stem = String(formData.get("stem") ?? "").trim();
  const leadIn = String(formData.get("leadIn") ?? "").trim();
  const correctLabel = String(formData.get("correctOption") ?? "");
  const tags = String(formData.get("tags") ?? "")
    .split(",")
    .map((t) => t.trim())
    .filter(Boolean);

  const options = parseOptions(formData);
  const discriminators = parseDiscriminators(formData);

  if (!topicId || !stem || !leadIn) {
    return { error: "Stem, lead-in and topic are required." };
  }
  if (options.some((o) => !o.text || !o.rationale)) {
    return { error: "Every option needs both option text and a rationale." };
  }
  if (!["A", "B", "C", "D", "E"].includes(correctLabel)) {
    return { error: "Mark exactly one option as correct." };
  }
  if (discriminators.length < 2) {
    return { error: "Add at least 2 discriminators." };
  }

  let id = questionId;

  if (id) {
    const { error } = await supabase
      .from("questions")
      .update({ exam, topic_id: topicId, difficulty, status, stem, lead_in: leadIn, tags })
      .eq("id", id);
    if (error) return { error: error.message };

    // Simplest correct approach for a low-volume admin tool: replace all
    // child rows rather than diffing them.
    await supabase.from("question_options").delete().eq("question_id", id);
    await supabase.from("question_discriminators").delete().eq("question_id", id);
  } else {
    const { data, error } = await supabase
      .from("questions")
      .insert({
        exam,
        topic_id: topicId,
        difficulty,
        status,
        stem,
        lead_in: leadIn,
        tags,
        created_by: user.id,
      })
      .select("id")
      .single();
    if (error || !data) return { error: error?.message ?? "Could not create question." };
    id = data.id;
  }

  const { error: optionsError } = await supabase.from("question_options").insert(
    options.map((o, i) => ({
      question_id: id!,
      label: o.label,
      option_text: o.text,
      rationale: o.rationale,
      is_correct: o.label === correctLabel,
      sort_order: i + 1,
    }))
  );
  if (optionsError) return { error: optionsError.message };

  const { error: discriminatorsError } = await supabase.from("question_discriminators").insert(
    discriminators.map((text, i) => ({
      question_id: id!,
      discriminator_text: text,
      sort_order: i + 1,
    }))
  );
  if (discriminatorsError) return { error: discriminatorsError.message };

  revalidatePath("/admin");
  redirect("/admin");
}

export async function deleteQuestionAction(questionId: string) {
  const supabase = await createClient();
  await supabase.from("questions").delete().eq("id", questionId);
  revalidatePath("/admin");
}

export type TopicFormState = { error: string | null };

export async function saveTopicAction(
  _prevState: TopicFormState,
  formData: FormData
): Promise<TopicFormState> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return { error: "Not signed in." };

  const topicId = String(formData.get("topicId") ?? "").trim() || null;
  const exam = String(formData.get("exam") ?? "") as ExamType;
  const specialty = String(formData.get("specialty") ?? "").trim();
  const name = String(formData.get("name") ?? "").trim();
  const slug = String(formData.get("slug") ?? "")
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");

  if (!specialty || !name || !slug) {
    return { error: "Specialty, name and slug are all required." };
  }

  const { error } = topicId
    ? await supabase
        .from("topics")
        .update({ exam, specialty, name, slug })
        .eq("id", topicId)
    : await supabase.from("topics").insert({ exam, specialty, name, slug });

  if (error) {
    if (error.code === "23505") {
      return { error: `A topic with slug "${slug}" already exists for this exam.` };
    }
    return { error: error.message };
  }

  revalidatePath("/admin/topics");
  redirect("/admin/topics");
}

export type DeleteTopicResult = { error: string | null };

export async function deleteTopicAction(topicId: string): Promise<DeleteTopicResult> {
  const supabase = await createClient();
  const { error } = await supabase.from("topics").delete().eq("id", topicId);

  if (error) {
    // FK is ON DELETE RESTRICT, so this fires whenever questions still
    // reference the topic — the friendliest possible outcome here is just
    // telling the admin to move/delete those questions first.
    if (error.code === "23503") {
      return { error: "This topic still has questions attached — move or delete those first." };
    }
    return { error: error.message };
  }

  revalidatePath("/admin/topics");
  return { error: null };
}
