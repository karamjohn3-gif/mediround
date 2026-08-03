import Link from "next/link";

export function SiteFooter() {
  return (
    <footer className="border-t border-(--color-ink-100) mt-auto">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 py-8 flex flex-col sm:flex-row items-center justify-between gap-4 text-sm text-(--color-ink-500)">
        <p>&copy; {new Date().getFullYear()} MediRound. Learn. Excel.</p>
        <nav aria-label="Footer" className="flex items-center gap-5">
          <Link href="/pricing" className="hover:text-(--color-navy-900) transition-colors">
            Pricing
          </Link>
          <Link href="/settings" className="hover:text-(--color-navy-900) transition-colors">
            Accessibility settings
          </Link>
        </nav>
      </div>
    </footer>
  );
}
