"use client";

import { useId } from "react";
import { useTextSize, type TextSize } from "@/contexts/TextSizeContext";
import { cn } from "@/lib/utils";

const OPTIONS: { id: TextSize; label: string; sample: string }[] = [
  { id: "base", label: "Default", sample: "text-base" },
  { id: "lg", label: "Large", sample: "text-lg" },
  { id: "xl", label: "Extra large", sample: "text-xl" },
];

export function TextSizeSettings() {
  const { textSize, setTextSize } = useTextSize();
  const groupId = useId();

  return (
    <fieldset>
      <legend className="font-semibold text-(--color-ink-900) mb-1">Text size</legend>
      <p id={`${groupId}-hint`} className="text-sm text-(--color-ink-500) mb-3">
        Applies across the whole app, including practice questions.
      </p>
      <div className="grid sm:grid-cols-3 gap-3" aria-describedby={`${groupId}-hint`}>
        {OPTIONS.map((option) => {
          const checked = textSize === option.id;
          return (
            <label
              key={option.id}
              className={cn(
                "flex flex-col items-center gap-1.5 rounded-2xl border-2 px-4 py-4 cursor-pointer transition-colors has-[:focus-visible]:outline has-[:focus-visible]:outline-3 has-[:focus-visible]:outline-(--color-teal-600) has-[:focus-visible]:outline-offset-2",
                checked
                  ? "border-(--color-navy-900) bg-(--color-navy-50)"
                  : "border-(--color-ink-200) hover:border-(--color-navy-600)"
              )}
            >
              <input
                type="radio"
                name="text-size"
                value={option.id}
                checked={checked}
                onChange={() => setTextSize(option.id)}
                className="sr-only"
              />
              <span className={cn("font-bold text-(--color-ink-900)", option.sample)}>Aa</span>
              <span className="text-sm font-semibold text-(--color-ink-700)">{option.label}</span>
            </label>
          );
        })}
      </div>
    </fieldset>
  );
}
