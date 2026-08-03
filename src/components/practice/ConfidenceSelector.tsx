"use client";

import { CONFIDENCE_LEVELS } from "@/lib/constants";
import type { ConfidenceLevel } from "@/lib/types/database";
import { cn } from "@/lib/utils";

export function ConfidenceSelector({
  value,
  onChange,
  name,
  disabled,
}: {
  value: ConfidenceLevel | null;
  onChange: (value: ConfidenceLevel) => void;
  name: string;
  disabled?: boolean;
}) {
  return (
    <fieldset disabled={disabled}>
      <legend className="text-sm font-semibold text-(--color-ink-700) mb-2">
        How confident are you?{" "}
        <span className="font-normal text-(--color-ink-500)">(optional)</span>
      </legend>
      <div className="flex flex-wrap gap-2">
        {CONFIDENCE_LEVELS.map((level) => {
          const checked = value === level.id;
          return (
            <label
              key={level.id}
              className={cn(
                "relative flex flex-col items-center rounded-2xl border-2 px-4 py-2.5 cursor-pointer transition-colors min-w-[7.5rem] has-[:focus-visible]:outline has-[:focus-visible]:outline-3 has-[:focus-visible]:outline-(--color-teal-600) has-[:focus-visible]:outline-offset-2",
                checked
                  ? "border-(--color-navy-900) bg-(--color-navy-900) text-white"
                  : "border-(--color-ink-200) bg-white text-(--color-ink-700) hover:border-(--color-navy-600)",
                disabled && "opacity-50 cursor-not-allowed"
              )}
            >
              <input
                type="radio"
                name={name}
                value={level.id}
                checked={checked}
                onChange={() => onChange(level.id)}
                className="sr-only"
              />
              <span className="font-semibold text-sm">{level.label}</span>
              <span className={cn("text-xs", checked ? "text-white/80" : "text-(--color-ink-500)")}>
                {level.hint}
              </span>
            </label>
          );
        })}
      </div>
    </fieldset>
  );
}
