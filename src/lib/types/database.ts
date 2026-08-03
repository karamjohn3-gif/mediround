// Hand-written to mirror supabase/migrations/0001_init.sql.
// If the schema changes, prefer regenerating with the Supabase CLI:
//   supabase gen types typescript --project-id <ref> > src/lib/types/database.ts
//
// Every table/view needs a `Relationships` array and the schema needs a
// `Functions` map (even if empty) — @supabase/supabase-js's `GenericSchema`
// constraint silently resolves `.from()` to `never` without them.

export type ExamType = "ukmla" | "mrcp1";
export type UserRole = "student" | "admin";
export type QuestionStatus = "draft" | "published";
export type QuestionDifficulty = "foundation" | "core" | "advanced";
export type ConfidenceLevel = "guessing" | "fairly_sure" | "certain";
export type ErrorType =
  | "knowledge_gap"
  | "reasoning_error"
  | "misread_stem"
  | "careless_slip";
export type SubscriptionStatus =
  | "none"
  | "trialing"
  | "active"
  | "past_due"
  | "canceled";

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string;
          email: string;
          display_name: string | null;
          role: UserRole;
          stripe_customer_id: string | null;
          stripe_subscription_id: string | null;
          subscription_status: SubscriptionStatus;
          subscription_current_period_end: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: Partial<Database["public"]["Tables"]["profiles"]["Row"]> & {
          id: string;
          email: string;
        };
        Update: Partial<Database["public"]["Tables"]["profiles"]["Row"]>;
        Relationships: [];
      };
      topics: {
        Row: {
          id: string;
          exam: ExamType;
          specialty: string;
          name: string;
          slug: string;
          created_at: string;
        };
        Insert: Partial<Database["public"]["Tables"]["topics"]["Row"]> & {
          exam: ExamType;
          specialty: string;
          name: string;
          slug: string;
        };
        Update: Partial<Database["public"]["Tables"]["topics"]["Row"]>;
        Relationships: [];
      };
      questions: {
        Row: {
          id: string;
          exam: ExamType;
          topic_id: string;
          status: QuestionStatus;
          difficulty: QuestionDifficulty;
          stem: string;
          lead_in: string;
          tags: string[];
          created_by: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: Partial<Database["public"]["Tables"]["questions"]["Row"]> & {
          exam: ExamType;
          topic_id: string;
          stem: string;
          lead_in: string;
        };
        Update: Partial<Database["public"]["Tables"]["questions"]["Row"]>;
        Relationships: [
          {
            foreignKeyName: "questions_topic_id_fkey";
            columns: ["topic_id"];
            isOneToOne: false;
            referencedRelation: "topics";
            referencedColumns: ["id"];
          },
        ];
      };
      question_options: {
        Row: {
          id: string;
          question_id: string;
          label: "A" | "B" | "C" | "D" | "E";
          option_text: string;
          is_correct: boolean;
          rationale: string;
          sort_order: number;
        };
        Insert: Partial<
          Database["public"]["Tables"]["question_options"]["Row"]
        > & {
          question_id: string;
          label: "A" | "B" | "C" | "D" | "E";
          option_text: string;
          rationale: string;
          sort_order: number;
        };
        Update: Partial<Database["public"]["Tables"]["question_options"]["Row"]>;
        Relationships: [
          {
            foreignKeyName: "question_options_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
      question_discriminators: {
        Row: {
          id: string;
          question_id: string;
          discriminator_text: string;
          sort_order: number;
        };
        Insert: Partial<
          Database["public"]["Tables"]["question_discriminators"]["Row"]
        > & {
          question_id: string;
          discriminator_text: string;
          sort_order: number;
        };
        Update: Partial<
          Database["public"]["Tables"]["question_discriminators"]["Row"]
        >;
        Relationships: [
          {
            foreignKeyName: "question_discriminators_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
      attempts: {
        Row: {
          id: string;
          user_id: string;
          question_id: string;
          chosen_option_id: string;
          confidence: ConfidenceLevel | null;
          is_correct: boolean;
          error_type: ErrorType | null;
          time_taken_seconds: number | null;
          created_at: string;
        };
        Insert: Partial<Database["public"]["Tables"]["attempts"]["Row"]> & {
          user_id: string;
          question_id: string;
          chosen_option_id: string;
          is_correct: boolean;
        };
        Update: Partial<Database["public"]["Tables"]["attempts"]["Row"]>;
        Relationships: [
          {
            foreignKeyName: "attempts_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
      fsrs_state: {
        Row: {
          id: string;
          user_id: string;
          question_id: string;
          due: string;
          stability: number;
          difficulty: number;
          elapsed_days: number;
          scheduled_days: number;
          learning_steps: number;
          reps: number;
          lapses: number;
          state: number;
          last_review: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: Partial<Database["public"]["Tables"]["fsrs_state"]["Row"]> & {
          user_id: string;
          question_id: string;
        };
        Update: Partial<Database["public"]["Tables"]["fsrs_state"]["Row"]>;
        Relationships: [
          {
            foreignKeyName: "fsrs_state_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Views: {
      question_options_public: {
        Row: {
          id: string;
          question_id: string;
          label: "A" | "B" | "C" | "D" | "E";
          option_text: string;
          sort_order: number;
        };
        Relationships: [
          {
            foreignKeyName: "question_options_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Functions: {
      submit_attempt: {
        Args: {
          p_question_id: string;
          p_chosen_option_id: string;
          p_confidence?: ConfidenceLevel | null;
          p_time_taken_seconds?: number | null;
        };
        Returns: {
          attempt_id: string;
          is_correct: boolean;
          correct_option_id: string;
          options: {
            id: string;
            label: "A" | "B" | "C" | "D" | "E";
            option_text: string;
            is_correct: boolean;
            rationale: string;
            sort_order: number;
          }[];
          discriminators: { id: string; discriminator_text: string; sort_order: number }[];
        }[];
      };
    };
  };
}
