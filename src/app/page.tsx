import { ButtonLink } from "@/components/ui/Button";
import { EXAMS, SUBSCRIPTION_PRICE_GBP } from "@/lib/constants";
import { Brain } from "@phosphor-icons/react/dist/ssr/Brain";
import { Target } from "@phosphor-icons/react/dist/ssr/Target";
import { ChartLineUp } from "@phosphor-icons/react/dist/ssr/ChartLineUp";
import { RepeatOnce } from "@phosphor-icons/react/dist/ssr/RepeatOnce";

const FEATURES = [
  {
    icon: Target,
    title: "State your confidence first",
    body: "Guessing, fairly sure, or certain — before you see if you're right. That's what makes the calibration curve on your dashboard meaningful.",
  },
  {
    icon: Brain,
    title: "Every wrong option, ruled out",
    body: "Not just “wrong” — a one-line reason each distractor is ruled out, plus the 2–3 discriminators that separate the real diagnosis from its mimics.",
  },
  {
    icon: ChartLineUp,
    title: "Know why you got it wrong",
    body: "Didn’t know the fact, reasoned wrong, misread the stem, or a careless slip — tag every mistake so patterns show up on your dashboard, not just a score.",
  },
  {
    icon: RepeatOnce,
    title: "Spaced repetition that adapts",
    body: "An FSRS-powered review queue reschedules questions based on how you actually performed — not a fixed interval.",
  },
];

export default function Home() {
  return (
    <div className="flex flex-col flex-1">
      <section className="bg-gradient-to-b from-(--color-navy-50) to-white">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 py-16 sm:py-24 text-center">
          <p className="inline-flex items-center gap-2 rounded-full bg-(--color-teal-50) text-(--color-teal-700) text-sm font-semibold px-4 py-1.5">
            UKMLA &middot; MRCP Part 1
          </p>
          <h1 className="font-display text-4xl sm:text-6xl font-extrabold text-(--color-navy-900) mt-6 leading-[1.05]">
            Learn to think like a doctor,
            <br className="hidden sm:block" /> not just answer like one.
          </h1>
          <p className="text-lg text-(--color-ink-500) mt-6 max-w-xl mx-auto">
            MediRound is a question bank built around clinical reasoning: state your confidence,
            answer, and see exactly why every option was right or wrong.
          </p>
          <div className="flex flex-wrap items-center justify-center gap-3 mt-8">
            <ButtonLink href="/signup" variant="accent" size="lg">
              Start free &mdash; 5 questions
            </ButtonLink>
            <ButtonLink href="/login" variant="outline" size="lg">
              Sign in
            </ButtonLink>
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-5xl px-4 sm:px-6 py-16 sm:py-24 w-full">
        <h2 className="font-display text-2xl sm:text-3xl font-extrabold text-(--color-ink-900) text-center max-w-2xl mx-auto">
          Built to teach reasoning, not just mark answers
        </h2>
        <div className="grid sm:grid-cols-2 gap-5 mt-10">
          {FEATURES.map((feature) => (
            <div
              key={feature.title}
              className="rounded-3xl border border-(--color-ink-100) p-6 sm:p-7"
            >
              <span className="inline-flex items-center justify-center w-11 h-11 rounded-2xl bg-(--color-navy-50) text-(--color-navy-900)">
                <feature.icon size={22} weight="bold" aria-hidden="true" />
              </span>
              <h3 className="font-display text-lg font-bold text-(--color-ink-900) mt-4">
                {feature.title}
              </h3>
              <p className="text-(--color-ink-500) mt-1.5 leading-relaxed">{feature.body}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="bg-(--color-navy-900)">
        <div className="mx-auto max-w-5xl px-4 sm:px-6 py-16 sm:py-20 text-center">
          <h2 className="font-display text-2xl sm:text-3xl font-extrabold text-white">
            One subscription, every exam
          </h2>
          <p className="text-white/70 mt-3 max-w-md mx-auto">
            Unlimited practice across {EXAMS.map((e) => e.name).join(", ")}, your progress
            dashboard and the spaced-repetition review queue.
          </p>
          <p className="font-display text-5xl font-extrabold text-white mt-6">
            &pound;{SUBSCRIPTION_PRICE_GBP}
            <span className="text-lg font-semibold text-white/60">/month</span>
          </p>
          <ButtonLink href="/signup" variant="accent" size="lg" className="mt-8">
            Start free &mdash; no card required
          </ButtonLink>
        </div>
      </section>
    </div>
  );
}
