"use server";

import { createClient } from "@/lib/supabase/server";
import type { ConfidenceLevel, ErrorType } from "@/lib/types/database";
import type { SubmitAttemptResult } from "@/lib/types/domain";

export type SubmitAttemptActionResult =
  | { ok: true; data: SubmitAttemptResult }
  | { ok: false; error: "free_limit_reached" | "unknown"; message: string };

export async function submitAttemptAction(
  questionId: string,
  chosenOptionId: string,
  confidence: ConfidenceLevel | null,
  timeTakenSeconds: number
): Promise<SubmitAttemptActionResult> {
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("submit_attempt", {
    p_question_id: questionId,
    p_chosen_option_id: chosenOptionId,
    p_confidence: confidence,
    p_time_taken_seconds: Math.round(timeTakenSeconds),
  });

  if (error) {
    if (error.message.includes("FREE_LIMIT_REACHED")) {
      return {
        ok: false,
        error: "free_limit_reached",
        message: "You've used all your free questions.",
      };
    }
    // Log the real Postgres exception server-side (visible in Netlify/server
    // logs) rather than only surfacing a generic message — this is exactly
    // the kind of RPC failure that's otherwise invisible until a user
    // reports it manually.
    console.error("submit_attempt RPC failed:", error.message);
    return { ok: false, error: "unknown", message: "Something went wrong grading that answer." };
  }

  const row = Array.isArray(data) ? data[0] : data;
  if (!row) {
    return { ok: false, error: "unknown", message: "Something went wrong grading that answer." };
  }
  return { ok: true, data: row };
}

export async function recordErrorTypeAction(attemptId: string, errorType: ErrorType) {
  const supabase = await createClient();
  await supabase
    .from("attempts")
    .update({ error_type: errorType })
    .eq("id", attemptId);
}
