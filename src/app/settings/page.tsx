import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { TextSizeSettings } from "@/components/settings/TextSizeSettings";
import { Button, ButtonLink } from "@/components/ui/Button";

export const metadata: Metadata = { title: "Settings — MediRound" };

export default async function SettingsPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null; // unreachable — proxy.ts gates this route

  const { data: profile } = await supabase
    .from("profiles")
    .select("display_name, email, subscription_status")
    .eq("id", user.id)
    .single();

  const isActive = profile?.subscription_status === "active";

  return (
    <div className="mx-auto max-w-2xl px-4 sm:px-6 py-10 sm:py-14 w-full">
      <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900) mb-8">
        Settings
      </h1>

      <section className="rounded-3xl border border-(--color-ink-100) p-6 mb-6">
        <h2 className="font-display text-lg font-bold text-(--color-ink-900) mb-4">
          Accessibility
        </h2>
        <TextSizeSettings />
      </section>

      <section className="rounded-3xl border border-(--color-ink-100) p-6 mb-6">
        <h2 className="font-display text-lg font-bold text-(--color-ink-900) mb-4">Account</h2>
        <dl className="flex flex-col gap-3 text-sm">
          <div className="flex justify-between">
            <dt className="text-(--color-ink-500)">Name</dt>
            <dd className="font-semibold text-(--color-ink-900)">
              {profile?.display_name || "—"}
            </dd>
          </div>
          <div className="flex justify-between">
            <dt className="text-(--color-ink-500)">Email</dt>
            <dd className="font-semibold text-(--color-ink-900)">{profile?.email}</dd>
          </div>
        </dl>
      </section>

      <section className="rounded-3xl border border-(--color-ink-100) p-6">
        <h2 className="font-display text-lg font-bold text-(--color-ink-900) mb-1">Billing</h2>
        {isActive ? (
          <>
            <p className="text-sm text-(--color-ink-500) mb-4">
              You&rsquo;re subscribed at £7/month. Manage your card or cancel anytime.
            </p>
            <form action="/api/stripe/portal" method="POST">
              <Button type="submit" variant="outline">
                Manage billing
              </Button>
            </form>
          </>
        ) : (
          <>
            <p className="text-sm text-(--color-ink-500) mb-4">
              You&rsquo;re not subscribed yet.
            </p>
            <ButtonLink href="/pricing" variant="accent">
              View pricing
            </ButtonLink>
          </>
        )}
      </section>
    </div>
  );
}
