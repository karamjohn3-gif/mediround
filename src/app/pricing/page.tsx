import type { Metadata } from "next";
import { CheckCircle } from "@phosphor-icons/react/dist/ssr/CheckCircle";
import { createClient } from "@/lib/supabase/server";
import { Button, ButtonLink } from "@/components/ui/Button";
import { EXAMS, SUBSCRIPTION_PRICE_GBP } from "@/lib/constants";

export const metadata: Metadata = { title: "Pricing — MediRound" };

const INCLUDED = [
  `Unlimited practice across ${EXAMS.map((e) => e.name).join(", ")}`,
  "Full explanations: every wrong option ruled out, with discriminators",
  "Confidence tracking and your personal calibration curve",
  "Progress dashboard by specialty, with pass-readiness scoring",
  "FSRS-powered spaced-repetition review queue",
];

export default async function PricingPage({
  searchParams,
}: {
  searchParams: Promise<{ checkout?: string }>;
}) {
  const { checkout } = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  let isActive = false;
  if (user) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("subscription_status")
      .eq("id", user.id)
      .single();
    isActive = profile?.subscription_status === "active";
  }

  return (
    <div className="mx-auto max-w-2xl px-4 sm:px-6 py-16 sm:py-24 w-full text-center">
      <h1 className="font-display text-3xl sm:text-4xl font-extrabold text-(--color-ink-900)">
        One plan. Everything included.
      </h1>
      <p className="text-(--color-ink-500) mt-3">
        No question packs, no exam-specific tiers &mdash; a single subscription covers every
        exam MediRound supports.
      </p>

      {checkout === "cancelled" && (
        <p role="status" className="mt-6 rounded-xl bg-(--color-ink-50) text-(--color-ink-700) px-4 py-3 text-sm">
          Checkout was cancelled &mdash; no charge was made.
        </p>
      )}
      {checkout === "error" && (
        <p role="alert" className="mt-6 rounded-xl bg-(--color-danger-50) text-(--color-danger-700) px-4 py-3 text-sm">
          Something went wrong starting checkout. Please try again.
        </p>
      )}

      <div className="mt-10 rounded-3xl border-2 border-(--color-navy-900) p-8 sm:p-10 text-left">
        <p className="font-display text-5xl font-extrabold text-(--color-navy-900)">
          &pound;{SUBSCRIPTION_PRICE_GBP}
          <span className="text-lg font-semibold text-(--color-ink-500)">/month</span>
        </p>
        <ul className="flex flex-col gap-3 mt-6">
          {INCLUDED.map((item) => (
            <li key={item} className="flex items-start gap-2.5 text-(--color-ink-700)">
              <CheckCircle
                size={20}
                weight="fill"
                className="text-(--color-teal-600) shrink-0 mt-0.5"
                aria-hidden="true"
              />
              {item}
            </li>
          ))}
        </ul>

        <div className="mt-8">
          {isActive ? (
            <p className="text-center font-semibold text-(--color-success-700)">
              You&rsquo;re subscribed &mdash; manage it from{" "}
              <a href="/settings" className="underline">
                Settings
              </a>
              .
            </p>
          ) : user ? (
            <form action="/api/stripe/checkout" method="POST">
              <Button type="submit" variant="accent" size="lg" className="w-full">
                Subscribe now
              </Button>
            </form>
          ) : (
            <ButtonLink href="/signup" variant="accent" size="lg" className="w-full">
              Create a free account first
            </ButtonLink>
          )}
        </div>
      </div>
    </div>
  );
}
