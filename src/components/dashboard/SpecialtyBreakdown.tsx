import type { SpecialtyStat } from "@/lib/dashboard";
import { cn } from "@/lib/utils";

export function SpecialtyBreakdown({ stats }: { stats: SpecialtyStat[] }) {
  if (stats.length === 0) {
    return (
      <p className="text-(--color-ink-500) text-sm">
        Answer a few questions and your performance by specialty will show up here.
      </p>
    );
  }

  return (
    <ul className="flex flex-col gap-4">
      {stats.map((stat) => (
        <li key={stat.specialty}>
          <div className="flex items-center justify-between text-sm mb-1.5">
            <span className="font-semibold text-(--color-ink-900)">{stat.specialty}</span>
            <span className="text-(--color-ink-500)">
              {stat.accuracy}% &middot; {stat.correct}/{stat.total}
            </span>
          </div>
          <div
            role="progressbar"
            aria-valuenow={stat.accuracy}
            aria-valuemin={0}
            aria-valuemax={100}
            aria-label={`${stat.specialty} accuracy`}
            className="h-2.5 rounded-full bg-(--color-ink-100) overflow-hidden"
          >
            <div
              className={cn(
                "h-full rounded-full transition-all",
                stat.accuracy < 50
                  ? "bg-(--color-danger-600)"
                  : stat.accuracy < 75
                    ? // warning-600 fails 3:1 non-text contrast against the
                      // ink-100 track — warning-700 clears it (4.2:1).
                      "bg-(--color-warning-700)"
                    : "bg-(--color-success-600)"
              )}
              style={{ width: `${stat.accuracy}%` }}
            />
          </div>
        </li>
      ))}
    </ul>
  );
}
