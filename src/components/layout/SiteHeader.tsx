import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/layout/Logo";
import { TextSizeControl } from "@/components/layout/TextSizeControl";
import { ButtonLink } from "@/components/ui/Button";
import { signOutAction } from "@/lib/actions/auth";

const NAV_LINKS = [
  { href: "/practice", label: "Practice" },
  { href: "/review", label: "Review" },
  { href: "/dashboard", label: "Dashboard" },
];

export async function SiteHeader() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  let isAdmin = false;
  if (user) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("role")
      .eq("id", user.id)
      .single();
    isAdmin = profile?.role === "admin";
  }

  return (
    <header className="border-b border-(--color-ink-100) bg-white/95 backdrop-blur supports-backdrop-blur:bg-white/80 sticky top-0 z-40">
      <div className="mx-auto max-w-6xl px-4 sm:px-6 h-16 flex items-center justify-between gap-4">
        <div className="flex items-center gap-6">
          <Logo />
          {user && (
            <nav aria-label="Main" className="hidden md:flex items-center gap-1">
              {NAV_LINKS.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  className="rounded-full px-3.5 py-2 text-sm font-semibold text-(--color-ink-700) hover:bg-(--color-ink-50) hover:text-(--color-navy-900) transition-colors"
                >
                  {link.label}
                </Link>
              ))}
              {isAdmin && (
                <Link
                  href="/admin"
                  className="rounded-full px-3.5 py-2 text-sm font-semibold text-(--color-teal-700) hover:bg-(--color-teal-50) transition-colors"
                >
                  Admin
                </Link>
              )}
            </nav>
          )}
        </div>

        <div className="flex items-center gap-3">
          <TextSizeControl />
          {user ? (
            <>
              <Link
                href="/settings"
                className="hidden sm:inline text-sm font-semibold text-(--color-ink-700) hover:text-(--color-navy-900) rounded-full px-3 py-2 hover:bg-(--color-ink-50) transition-colors"
              >
                Settings
              </Link>
              <form action={signOutAction}>
                <button
                  type="submit"
                  className="cursor-pointer text-sm font-semibold text-(--color-ink-700) hover:text-(--color-navy-900) rounded-full px-3 py-2 hover:bg-(--color-ink-50) transition-colors"
                >
                  Sign out
                </button>
              </form>
            </>
          ) : (
            <>
              <ButtonLink href="/login" variant="ghost" size="sm">
                Sign in
              </ButtonLink>
              <ButtonLink href="/signup" variant="accent" size="sm">
                Start free
              </ButtonLink>
            </>
          )}
        </div>
      </div>
      {user && (
        <nav
          aria-label="Main"
          className="md:hidden flex items-center gap-1 overflow-x-auto px-4 pb-2 -mt-1"
        >
          {NAV_LINKS.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="rounded-full px-3 py-1.5 text-sm font-semibold text-(--color-ink-700) hover:bg-(--color-ink-50) whitespace-nowrap"
            >
              {link.label}
            </Link>
          ))}
          {isAdmin && (
            <Link
              href="/admin"
              className="rounded-full px-3 py-1.5 text-sm font-semibold text-(--color-teal-700) whitespace-nowrap"
            >
              Admin
            </Link>
          )}
        </nav>
      )}
    </header>
  );
}
