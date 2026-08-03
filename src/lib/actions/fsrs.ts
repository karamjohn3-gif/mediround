"use server";

import { createClient } from "@/lib/supabase/server";
import { rowToCard, cardToRowPatch, scheduleNext } from "@/lib/fsrs";
import type { ConfidenceLevel } from "@/lib/types/database";

/** Reschedules a question in the user's spaced-repetition queue based on
 * how they just answered it. Called after every attempt, in both regular
 * practice and the dedicated review queue, so the whole question bank
 * feeds one scheduler. Best-effort: failures here shouldn't block the
 * practice flow, so this never throws to the caller. */
export async function updateFsrsStateAction(
  questionId: string,
  isCorrect: boolean,
  confidence: ConfidenceLevel | null
) {
  try {
    const supabase = await createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) return;

    const { data: existing } = await supabase
      .from("fsrs_state")
      .select("*")
      .eq("user_id", user.id)
      .eq("question_id", questionId)
      .maybeSingle();

    const previousCard = rowToCard(existing ?? null);
    const nextCard = scheduleNext(previousCard, isCorrect, confidence);

    await supabase
      .from("fsrs_state")
      .upsert(
        { user_id: user.id, question_id: questionId, ...cardToRowPatch(nextCard) },
        { onConflict: "user_id,question_id" }
      );
  } catch {
    // Scheduling is a nice-to-have layered on top of the core practice
    // flow — never let it surface as a user-facing error.
  }
}
