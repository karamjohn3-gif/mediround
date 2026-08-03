"use client";

import { useActionState, useState } from "react";
import { saveTopicAction, type TopicFormState } from "@/lib/actions/admin";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";
import { EXAMS } from "@/lib/constants";
import type { ExamType } from "@/lib/types/database";

export interface TopicFormInitial {
  id: string;
  exam: ExamType;
  specialty: string;
  name: string;
  slug: string;
}

const initialFormState: TopicFormState = { error: null };

function slugify(value: string) {
  return value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function TopicForm({ initial }: { initial?: TopicFormInitial }) {
  const [state, formAction, pending] = useActionState(saveTopicAction, initialFormState);
  const [name, setName] = useState(initial?.name ?? "");
  const [slug, setSlug] = useState(initial?.slug ?? "");
  const [slugTouched, setSlugTouched] = useState(!!initial);

  function handleNameChange(value: string) {
    setName(value);
    if (!slugTouched) setSlug(slugify(value));
  }

  return (
    <form action={formAction} className="flex flex-col gap-4 max-w-lg">
      {initial && <input type="hidden" name="topicId" value={initial.id} />}

      <div className="flex flex-col gap-1.5">
        <label htmlFor="exam" className="text-sm font-semibold text-(--color-ink-700)">
          Exam
        </label>
        <select
          id="exam"
          name="exam"
          defaultValue={initial?.exam ?? "ukmla"}
          className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 bg-white"
        >
          {EXAMS.map((e) => (
            <option key={e.id} value={e.id}>
              {e.name}
            </option>
          ))}
        </select>
      </div>

      <FormField
        label="Specialty"
        id="specialty"
        name="specialty"
        required
        defaultValue={initial?.specialty}
        hint='Groups topics on the dashboard, e.g. "Cardiology"'
      />

      <FormField
        label="Topic name"
        id="name"
        name="name"
        required
        value={name}
        onChange={(e) => handleNameChange(e.target.value)}
        hint='e.g. "Acute coronary syndromes"'
      />

      <FormField
        label="Slug"
        id="slug"
        name="slug"
        required
        value={slug}
        onChange={(e) => {
          setSlugTouched(true);
          setSlug(slugify(e.target.value));
        }}
        hint="Must be unique within the exam. Auto-filled from the name."
      />

      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}

      <Button type="submit" disabled={pending} size="lg" className="self-start">
        {pending ? "Saving…" : initial ? "Save changes" : "Create topic"}
      </Button>
    </form>
  );
}
