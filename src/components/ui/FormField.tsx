import { cn } from "@/lib/utils";
import type { ComponentPropsWithoutRef } from "react";

type FormFieldProps = {
  label: string;
  id: string;
  hint?: string;
  className?: string;
};

export function FormField({
  label,
  id,
  hint,
  className,
  ...props
}: FormFieldProps & ComponentPropsWithoutRef<"input">) {
  const hintId = hint ? `${id}-hint` : undefined;

  return (
    <div className={cn("flex flex-col gap-1.5", className)}>
      <label htmlFor={id} className="text-sm font-semibold text-(--color-ink-700)">
        {label}
      </label>
      <input
        id={id}
        aria-describedby={hintId}
        className="rounded-xl border border-(--color-ink-200) px-4 py-2.5 text-base text-(--color-ink-900) bg-white placeholder:text-(--color-ink-500) focus-visible:outline-3 focus-visible:outline-(--color-teal-600) focus-visible:outline-offset-1"
        {...props}
      />
      {hint && (
        <p id={hintId} className="text-xs text-(--color-ink-500)">
          {hint}
        </p>
      )}
    </div>
  );
}
