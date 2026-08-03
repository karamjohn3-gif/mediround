"use client";

import { useId, useState } from "react";
import { ERROR_TYPES } from "@/lib/constants";
import type { ErrorType } from "@/lib/types/database";
import { cn } from "@/lib/utils";

export function ErrorTypePrompt({
  onSelect,
}: {
  onSelect: (type: ErrorType) => void;
}) {
  const [chosen, setChosen] = useState<ErrorType | null>(null);
  const headingId = useId();

  function handlePick(type: ErrorType) {
    setChosen(type);
    onSelect(type);
  }

  return (
    <div
      role="group"
      aria-labelledby={headingId}
      className="rounded-2xl border border-(--color-warning-100) bg-(--color-warning-50) p-5"
    >
      <h2 id={headingId} className="font-display font-bold text-(--color-warning-700)">
        What went wrong?
      </h2>
      <p className="text-sm text-(--color-ink-700) mt-1 mb-3">
        Understanding why helps us tailor what you review next.
      </p>
      <div className="grid sm:grid-cols-2 gap-2">
        {ERROR_TYPES.map((type) => (
          <button
            key={type.id}
            type="button"
            onClick={() => handlePick(type.id)}
            aria-pressed={chosen === type.id}
            className={cn(
              "cursor-pointer text-left rounded-xl border-2 px-4 py-3 transition-colors",
              chosen === type.id
                ? "border-(--color-navy-900) bg-(--color-navy-900) text-white"
                : "border-(--color-ink-200) bg-white hover:border-(--color-navy-600)"
            )}
          >
            <span className="block font-semibold text-sm">{type.label}</span>
            <span
              className={cn(
                "block text-xs mt-0.5",
                chosen === type.id ? "text-white/80" : "text-(--color-ink-500)"
              )}
            >
              {type.description}
            </span>
          </button>
        ))}
      </div>
      {!chosen && (
        <p className="text-xs text-(--color-ink-500) mt-3">
          Optional — you can continue without answering.
        </p>
      )}
    </div>
  );
}
