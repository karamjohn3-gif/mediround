import Link from "next/link";

export function AdminNav({ active }: { active: "questions" | "topics" }) {
  return (
    <nav aria-label="Admin sections" className="flex gap-1 mb-8 border-b border-(--color-ink-100)">
      <Link
        href="/admin"
        aria-current={active === "questions" ? "page" : undefined}
        className={
          active === "questions"
            ? "px-4 py-2.5 text-sm font-semibold text-(--color-navy-900) border-b-2 border-(--color-navy-900) -mb-px"
            : "px-4 py-2.5 text-sm font-semibold text-(--color-ink-500) hover:text-(--color-ink-900)"
        }
      >
        Questions
      </Link>
      <Link
        href="/admin/topics"
        aria-current={active === "topics" ? "page" : undefined}
        className={
          active === "topics"
            ? "px-4 py-2.5 text-sm font-semibold text-(--color-navy-900) border-b-2 border-(--color-navy-900) -mb-px"
            : "px-4 py-2.5 text-sm font-semibold text-(--color-ink-500) hover:text-(--color-ink-900)"
        }
      >
        Topics
      </Link>
    </nav>
  );
}
