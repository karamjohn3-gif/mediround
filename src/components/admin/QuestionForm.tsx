"use client";

import Link from "next/link";
import { useActionState, useState } from "react";
import { saveQuestionAction, type QuestionFormState } from "@/lib/actions/admin";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";
import { EXAMS, DIFFICULTY_LABELS } from "@/lib/constants";
import type { ExamType, QuestionDifficulty, QuestionStatus } from "@/lib/types/database";

const OPTION_LABELS = ["A", "B", "C", "D", "E"] as const;
const DIFFICULTIES: QuestionDifficulty[] = ["foundation", "core", "advanced"];

export interface QuestionFormTopic {
  id: string;
  exam: ExamType;
  specialty: string;
  name: string;
}

export interface QuestionFormInitial {
  id: string;
  exam: ExamType;
  topicId: string;
  difficulty: QuestionDifficulty;
  status: QuestionStatus;
  stem: string;
  leadIn: string;
  tags: string[];
  options: {
    label: (typeof OPTION_LABELS)[number];
    text: string;
    rationale: string;
    isCorrect: boolean;
  }[];
  discriminators: string[];
}

const initialFormState: QuestionFormState = { error: null };

export function QuestionForm({
  topics,
  initial,
}: {
  topics: QuestionFormTopic[];
  initial?: QuestionFormInitial;
}) {
  const [state, formAction, pending] = useActionState(saveQuestionAction, initialFormState);
  const [exam, setExam] = useState<ExamType>(initial?.exam ?? "ukmla");
  const [correctOption, setCorrectOption] = useState(
    initial?.options.find((o) => o.isCorrect)?.label ?? ""
  );
  const [discriminators, setDiscriminators] = useState<string[]>(
    initial?.discriminators && initial.discriminators.length >= 2
      ? initial.discriminators
      : ["", ""]
  );

  const topicsForExam = topics.filter((t) => t.exam === exam);

  function optionFor(label: (typeof OPTION_LABELS)[number]) {
    return initial?.options.find((o) => o.label === label);
  }

  return (
    <form action={formAction} className="flex flex-col gap-8">
      {initial && <input type="hidden" name="questionId" value={initial.id} />}

      <section className="grid sm:grid-cols-2 gap-4">
        <div className="flex flex-col gap-1.5">
          <label htmlFor="exam" className="text-sm font-semibold text-(--color-ink-700)">
            Exam
          </label>
          <select
            id="exam"
            name="exam"
            value={exam}
            onChange={(e) => setExam(e.target.value as ExamType)}
            className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 bg-white"
          >
            {EXAMS.map((e) => (
              <option key={e.id} value={e.id}>
                {e.name}
              </option>
            ))}
          </select>
        </div>

        <div className="flex flex-col gap-1.5">
          <div className="flex items-center justify-between">
            <label htmlFor="topicId" className="text-sm font-semibold text-(--color-ink-700)">
              Topic
            </label>
            <Link
              href="/admin/topics/new"
              className="text-xs font-semibold text-(--color-navy-900) hover:underline"
            >
              + New topic
            </Link>
          </div>
          <select
            id="topicId"
            name="topicId"
            defaultValue={initial?.topicId}
            required
            className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 bg-white"
          >
            <option value="" disabled>
              Select a topic
            </option>
            {topicsForExam.map((t) => (
              <option key={t.id} value={t.id}>
                {t.specialty} &middot; {t.name}
              </option>
            ))}
          </select>
        </div>

        <div className="flex flex-col gap-1.5">
          <label htmlFor="difficulty" className="text-sm font-semibold text-(--color-ink-700)">
            Difficulty
          </label>
          <select
            id="difficulty"
            name="difficulty"
            defaultValue={initial?.difficulty ?? "core"}
            className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 bg-white"
          >
            {DIFFICULTIES.map((d) => (
              <option key={d} value={d}>
                {DIFFICULTY_LABELS[d]}
              </option>
            ))}
          </select>
        </div>

        <div className="flex flex-col gap-1.5">
          <label htmlFor="status" className="text-sm font-semibold text-(--color-ink-700)">
            Status
          </label>
          <select
            id="status"
            name="status"
            defaultValue={initial?.status ?? "draft"}
            className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 bg-white"
          >
            <option value="draft">Draft</option>
            <option value="published">Published</option>
          </select>
        </div>

        <div className="sm:col-span-2">
          <FormField
            label="Tags (comma-separated)"
            id="tags"
            name="tags"
            defaultValue={initial?.tags.join(", ")}
          />
        </div>
      </section>

      <section className="flex flex-col gap-4">
        <div className="flex flex-col gap-1.5">
          <label htmlFor="stem" className="text-sm font-semibold text-(--color-ink-700)">
            Stem (patient vignette + observations)
          </label>
          <textarea
            id="stem"
            name="stem"
            required
            rows={6}
            defaultValue={initial?.stem}
            className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 text-base leading-relaxed"
          />
        </div>
        <FormField
          label="Lead-in question"
          id="leadIn"
          name="leadIn"
          required
          defaultValue={initial?.leadIn}
          hint='e.g. "What is the most likely diagnosis?"'
        />
      </section>

      <section>
        <fieldset>
          <legend className="text-sm font-semibold text-(--color-ink-700) mb-3">
            Options — mark the correct one
          </legend>
          <div className="flex flex-col gap-4">
            {OPTION_LABELS.map((label) => (
              <div
                key={label}
                className="rounded-2xl border border-(--color-ink-200) p-4 flex flex-col gap-3"
              >
                <div className="flex items-center gap-3">
                  <label className="flex items-center gap-2 font-bold text-(--color-navy-900)">
                    <input
                      type="radio"
                      name="correctOption"
                      value={label}
                      checked={correctOption === label}
                      onChange={() => setCorrectOption(label)}
                    />
                    {label}
                  </label>
                  <span className="text-xs text-(--color-ink-500)">
                    {correctOption === label ? "Correct answer" : ""}
                  </span>
                </div>
                <FormField
                  label={`Option ${label} text`}
                  id={`option_text_${label}`}
                  name={`option_text_${label}`}
                  required
                  defaultValue={optionFor(label)?.text}
                />
                <div className="flex flex-col gap-1.5">
                  <label
                    htmlFor={`option_rationale_${label}`}
                    className="text-sm font-semibold text-(--color-ink-700)"
                  >
                    Rationale (why correct, or &ldquo;ruled out because&hellip;&rdquo;)
                  </label>
                  <textarea
                    id={`option_rationale_${label}`}
                    name={`option_rationale_${label}`}
                    required
                    rows={2}
                    defaultValue={optionFor(label)?.rationale}
                    className="rounded-xl border border-(--color-ink-200) px-4 py-2.5"
                  />
                </div>
              </div>
            ))}
          </div>
        </fieldset>
      </section>

      <section className="flex flex-col gap-3">
        <p className="text-sm font-semibold text-(--color-ink-700)">
          Discriminators (2&ndash;3 key differentiating features)
        </p>
        {discriminators.map((value, i) => (
          <div key={i} className="flex gap-2">
            <input
              type="text"
              name="discriminator"
              defaultValue={value}
              required={i < 2}
              className="flex-1 rounded-xl border border-(--color-ink-200) px-4 py-2.5"
              aria-label={`Discriminator ${i + 1}`}
            />
            {discriminators.length > 2 && (
              <button
                type="button"
                onClick={() =>
                  setDiscriminators((d) => d.filter((_, idx) => idx !== i))
                }
                className="cursor-pointer px-3 text-sm font-semibold text-(--color-danger-700)"
                aria-label={`Remove discriminator ${i + 1}`}
              >
                Remove
              </button>
            )}
          </div>
        ))}
        {discriminators.length < 3 && (
          <button
            type="button"
            onClick={() => setDiscriminators((d) => [...d, ""])}
            className="cursor-pointer self-start text-sm font-semibold text-(--color-navy-900) hover:underline"
          >
            + Add discriminator
          </button>
        )}
      </section>

      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}

      <Button type="submit" disabled={pending} size="lg" className="self-start">
        {pending ? "Saving…" : initial ? "Save changes" : "Create question"}
      </Button>
    </form>
  );
}
