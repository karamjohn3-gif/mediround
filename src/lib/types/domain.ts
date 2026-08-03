import type { Database } from "@/lib/types/database";

export type QuestionRow = Database["public"]["Tables"]["questions"]["Row"];
export type QuestionOptionRow =
  Database["public"]["Tables"]["question_options"]["Row"];
export type QuestionDiscriminatorRow =
  Database["public"]["Tables"]["question_discriminators"]["Row"];
export type TopicRow = Database["public"]["Tables"]["topics"]["Row"];
export type AttemptRow = Database["public"]["Tables"]["attempts"]["Row"];
export type ProfileRow = Database["public"]["Tables"]["profiles"]["Row"];
export type FsrsStateRow = Database["public"]["Tables"]["fsrs_state"]["Row"];

export type PublicQuestionOption =
  Database["public"]["Views"]["question_options_public"]["Row"];

export type SubmitAttemptResult =
  Database["public"]["Functions"]["submit_attempt"]["Returns"][number];

/** A question as shown BEFORE the user answers: safe columns only — no
 * is_correct, no rationale, no discriminators. Those only come back from
 * submit_attempt() once an answer has actually been submitted. */
export interface PracticeQuestion
  extends Pick<
    QuestionRow,
    "id" | "exam" | "topic_id" | "difficulty" | "stem" | "lead_in" | "tags"
  > {
  options: PublicQuestionOption[];
  topic: Pick<TopicRow, "id" | "name" | "specialty">;
}

/** A full question including answer-key content — only ever populated from
 * an admin query (author tool) or from submit_attempt()'s response, never
 * fetched directly for the practice flow. */
export interface FullQuestion extends QuestionRow {
  options: QuestionOptionRow[];
  discriminators: QuestionDiscriminatorRow[];
  topic: Pick<TopicRow, "id" | "name" | "specialty">;
}
