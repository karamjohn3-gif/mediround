"use client";

import { useState, useTransition } from "react";
import { deleteTopicAction } from "@/lib/actions/admin";

export function DeleteTopicButton({
  topicId,
  topicLabel,
}: {
  topicId: string;
  topicLabel: string;
}) {
  const [pending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);

  function handleClick() {
    if (!window.confirm(`Delete "${topicLabel}"? This can't be undone.`)) return;
    setError(null);
    startTransition(async () => {
      const result = await deleteTopicAction(topicId);
      if (result.error) setError(result.error);
    });
  }

  return (
    <div className="flex flex-col items-end gap-1">
      <button
        type="button"
        onClick={handleClick}
        disabled={pending}
        className="cursor-pointer text-sm font-semibold text-(--color-danger-700) hover:underline disabled:opacity-50"
      >
        {pending ? "Deleting…" : "Delete"}
      </button>
      {error && (
        <p role="alert" className="text-xs text-(--color-danger-700) max-w-[16rem] text-right">
          {error}
        </p>
      )}
    </div>
  );
}
