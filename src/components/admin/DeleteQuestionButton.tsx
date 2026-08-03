"use client";

import { useTransition } from "react";
import { deleteQuestionAction } from "@/lib/actions/admin";

export function DeleteQuestionButton({
  questionId,
  questionLabel,
}: {
  questionId: string;
  questionLabel: string;
}) {
  const [pending, startTransition] = useTransition();

  function handleClick() {
    if (!window.confirm(`Delete "${questionLabel}"? This can't be undone.`)) return;
    startTransition(() => {
      void deleteQuestionAction(questionId);
    });
  }

  return (
    <button
      type="button"
      onClick={handleClick}
      disabled={pending}
      className="cursor-pointer text-sm font-semibold text-(--color-danger-700) hover:underline disabled:opacity-50"
    >
      {pending ? "Deleting…" : "Delete"}
    </button>
  );
}
