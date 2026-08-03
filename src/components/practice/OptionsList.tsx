"use client";

import { cn } from "@/lib/utils";
import type { PublicQuestionOption, SubmitAttemptResult } from "@/lib/types/domain";

export function OptionsList({
  options,
  selectedOptionId,
  onChange,
  disabled,
  reveal,
}: {
  options: PublicQuestionOption[];
  selectedOptionId: string | null;
  onChange: (id: string) => void;
  disabled?: boolean;
  /** When present, the question has been answered — render each option
   * colour-coded against the answer key instead of as a plain radio. */
  reveal?: SubmitAttemptResult | null;
}) {
  return (
    <fieldset disabled={disabled}>
      <legend className="text-sm font-semibold text-(--color-ink-700) mb-2">
        Select the single best answer
      </legend>
      <div className="flex flex-col gap-2.5">
        {options.map((option) => {
          const checked = selectedOptionId === option.id;
          const revealOption = reveal?.options.find((o) => o.id === option.id);
          const isCorrectOption = reveal ? option.id === reveal.correct_option_id : false;
          const isChosenWrong = reveal ? checked && !isCorrectOption : false;

          return (
            <div key={option.id}>
              <label
                className={cn(
                  "flex items-start gap-3.5 rounded-2xl border-2 px-4 py-3.5 transition-colors has-[:focus-visible]:outline has-[:focus-visible]:outline-3 has-[:focus-visible]:outline-(--color-teal-600) has-[:focus-visible]:outline-offset-2",
                  !reveal && [
                    "cursor-pointer",
                    checked
                      ? "border-(--color-navy-900) bg-(--color-navy-50)"
                      : "border-(--color-ink-200) bg-white hover:border-(--color-navy-600)",
                  ],
                  reveal && "cursor-default",
                  reveal &&
                    isCorrectOption &&
                    "border-(--color-success-600) bg-(--color-success-50)",
                  reveal &&
                    isChosenWrong &&
                    "border-(--color-danger-600) bg-(--color-danger-50)",
                  reveal &&
                    !isCorrectOption &&
                    !isChosenWrong &&
                    "border-(--color-ink-100) bg-white opacity-70"
                )}
              >
                <input
                  type="radio"
                  name="option"
                  value={option.id}
                  checked={checked}
                  disabled={disabled || !!reveal}
                  onChange={() => onChange(option.id)}
                  className="sr-only"
                />
                <span
                  aria-hidden="true"
                  className={cn(
                    "flex items-center justify-center w-7 h-7 rounded-full text-sm font-bold shrink-0 mt-0.5",
                    // success-600 fails WCAG AA (3.7:1) for this 14px bold
                    // badge text — success-700 gives white text 5:1.
                    reveal && isCorrectOption && "bg-(--color-success-700) text-white",
                    reveal && isChosenWrong && "bg-(--color-danger-600) text-white",
                    !reveal && checked && "bg-(--color-navy-900) text-white",
                    !reveal && !checked && "bg-(--color-ink-100) text-(--color-ink-700)",
                    reveal && !isCorrectOption && !isChosenWrong && "bg-(--color-ink-100) text-(--color-ink-500)"
                  )}
                >
                  {option.label}
                </span>
                <span className="flex-1 text-(--color-ink-900) leading-snug pt-0.5">
                  {option.option_text}
                  {reveal && isCorrectOption && (
                    <span className="block text-xs font-bold uppercase tracking-wide text-(--color-success-700) mt-1">
                      Correct answer
                    </span>
                  )}
                  {reveal && isChosenWrong && (
                    <span className="block text-xs font-bold uppercase tracking-wide text-(--color-danger-700) mt-1">
                      Your answer
                    </span>
                  )}
                </span>
              </label>
              {revealOption && !isCorrectOption && (
                <p className="text-sm text-(--color-ink-600) mt-1.5 ml-11 pl-0">
                  <span className="font-semibold">Ruled out:</span> {revealOption.rationale}
                </p>
              )}
              {revealOption && isCorrectOption && (
                <p className="text-sm text-(--color-ink-600) mt-1.5 ml-11 pl-0">
                  {revealOption.rationale}
                </p>
              )}
            </div>
          );
        })}
      </div>
    </fieldset>
  );
}
