import type { Icon as PhosphorIcon } from "@phosphor-icons/react";
import { cn } from "@/lib/utils";

export function StatCard({
  label,
  value,
  hint,
  icon: Icon,
  accent = false,
}: {
  label: string;
  value: string;
  hint?: string;
  icon: PhosphorIcon;
  accent?: boolean;
}) {
  return (
    <div
      className={cn(
        "rounded-3xl border p-5",
        accent
          ? "border-(--color-navy-900) bg-(--color-navy-900) text-white"
          : "border-(--color-ink-100) bg-white"
      )}
    >
      <div className="flex items-center justify-between">
        <p
          className={cn(
            "text-sm font-semibold",
            accent ? "text-white/70" : "text-(--color-ink-500)"
          )}
        >
          {label}
        </p>
        <Icon
          size={18}
          weight="bold"
          aria-hidden={true}
          className={accent ? "text-white/70" : "text-(--color-ink-300)"}
        />
      </div>
      <p className="font-display text-3xl font-extrabold mt-2">{value}</p>
      {hint && (
        <p className={cn("text-xs mt-1", accent ? "text-white/60" : "text-(--color-ink-500)")}>
          {hint}
        </p>
      )}
    </div>
  );
}
