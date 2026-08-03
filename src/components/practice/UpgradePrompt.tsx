import { ButtonLink } from "@/components/ui/Button";
import { SUBSCRIPTION_PRICE_GBP } from "@/lib/constants";

export function UpgradePrompt({
  heading = "You've used your free questions",
}: {
  heading?: string;
}) {
  return (
    <div className="mx-auto max-w-lg text-center rounded-3xl border border-(--color-teal-100) bg-(--color-teal-50) px-8 py-12">
      <h1 className="font-display text-2xl font-bold text-(--color-navy-900)">{heading}</h1>
      <p className="text-(--color-ink-700) mt-3">
        Subscribe for unlimited practice across UKMLA and MRCP Part 1 — full explanations,
        discriminators, your progress dashboard and the spaced-repetition review queue.
      </p>
      <p className="font-display text-3xl font-extrabold text-(--color-navy-900) mt-6">
        £{SUBSCRIPTION_PRICE_GBP}<span className="text-base font-semibold text-(--color-ink-500)">/month</span>
      </p>
      <ButtonLink href="/pricing" variant="accent" size="lg" className="mt-6">
        Upgrade now
      </ButtonLink>
    </div>
  );
}
