import { ERROR_TYPES } from "@/lib/constants";
import type { ErrorTypeStat } from "@/lib/dashboard";

export function ErrorTypeBreakdown({ stats }: { stats: ErrorTypeStat[] }) {
  const total = stats.reduce((sum, s) => sum + s.count, 0);

  if (total === 0) {
    return (
      <p className="text-(--color-ink-500) text-sm">
        No mistakes tagged yet — when you get one wrong, tell us why and the pattern shows up
        here.
      </p>
    );
  }

  return (
    <ul className="flex flex-col gap-3">
      {stats.map((stat) => {
        const meta = ERROR_TYPES.find((e) => e.id === stat.errorType);
        const percent = Math.round((stat.count / total) * 100);
        return (
          <li key={stat.errorType} className="flex items-center gap-3">
            <div className="flex-1">
              <div className="flex items-center justify-between text-sm mb-1">
                <span className="font-semibold text-(--color-ink-900)">
                  {meta?.label ?? stat.errorType}
                </span>
                <span className="text-(--color-ink-500)">
                  {stat.count} &middot; {percent}%
                </span>
              </div>
              <div className="h-2 rounded-full bg-(--color-ink-100) overflow-hidden">
                <div
                  className="h-full rounded-full bg-(--color-warning-700)"
                  style={{ width: `${percent}%` }}
                />
              </div>
            </div>
          </li>
        );
      })}
    </ul>
  );
}
