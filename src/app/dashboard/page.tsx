import type { Metadata } from "next";
import { Target } from "@phosphor-icons/react/dist/ssr/Target";
import { Fire } from "@phosphor-icons/react/dist/ssr/Fire";
import { Gauge } from "@phosphor-icons/react/dist/ssr/Gauge";
import { ListChecks } from "@phosphor-icons/react/dist/ssr/ListChecks";
import { createClient } from "@/lib/supabase/server";
import {
  computeCalibration,
  computeReadinessScore,
  computeStreak,
  groupByErrorType,
  groupBySpecialty,
  READINESS_TARGET_QUESTIONS,
  type DashboardAttempt,
} from "@/lib/dashboard";
import { StatCard } from "@/components/dashboard/StatCard";
import { CalibrationChart } from "@/components/dashboard/CalibrationChart";
import { SpecialtyBreakdown } from "@/components/dashboard/SpecialtyBreakdown";
import { ErrorTypeBreakdown } from "@/components/dashboard/ErrorTypeBreakdown";
import { ButtonLink } from "@/components/ui/Button";

export const metadata: Metadata = { title: "Dashboard — MediRound" };

export default async function DashboardPage({
  searchParams,
}: {
  searchParams: Promise<{ checkout?: string; passwordUpdated?: string }>;
}) {
  const { checkout, passwordUpdated } = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null; // unreachable — proxy.ts gates this route

  const { data: rows } = await supabase
    .from("attempts")
    .select(
      "is_correct, confidence, error_type, created_at, question:questions(exam, topic:topics(specialty, name))"
    )
    .eq("user_id", user.id)
    .order("created_at", { ascending: true });

  const attempts: DashboardAttempt[] = (rows ?? [])
    .filter((r) => r.question?.topic)
    .map((r) => ({
      is_correct: r.is_correct,
      confidence: r.confidence,
      error_type: r.error_type,
      created_at: r.created_at,
      exam: r.question!.exam,
      specialty: r.question!.topic!.specialty,
      topic_name: r.question!.topic!.name,
    }));

  const total = attempts.length;
  const correct = attempts.filter((a) => a.is_correct).length;
  const accuracy = total > 0 ? Math.round((correct / total) * 100) : null;
  const streak = computeStreak(attempts.map((a) => a.created_at));
  const readiness = computeReadinessScore(attempts);
  const calibration = computeCalibration(attempts);
  const specialtyStats = groupBySpecialty(attempts);
  const errorStats = groupByErrorType(attempts);

  return (
    <div className="mx-auto max-w-5xl px-4 sm:px-6 py-10 sm:py-14 w-full">
      {passwordUpdated && (
        <p
          role="status"
          className="mb-6 rounded-xl bg-(--color-teal-50) text-(--color-teal-700) px-4 py-3 text-sm"
        >
          Your password has been updated.
        </p>
      )}
      {checkout === "success" && (
        <p
          role="status"
          className="mb-6 rounded-xl bg-(--color-teal-50) text-(--color-teal-700) px-4 py-3 text-sm"
        >
          You&rsquo;re subscribed! Unlimited practice is now unlocked.
        </p>
      )}
      <div className="flex flex-wrap items-center justify-between gap-4 mb-8">
        <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900)">
          Your progress
        </h1>
        <div className="flex gap-3">
          <ButtonLink href="/review" variant="outline">
            Review queue
          </ButtonLink>
          <ButtonLink href="/practice" variant="primary">
            Practice
          </ButtonLink>
        </div>
      </div>

      {total === 0 ? (
        <div className="rounded-3xl border border-(--color-ink-100) p-10 text-center">
          <p className="font-display text-xl font-bold text-(--color-ink-900)">
            No attempts yet
          </p>
          <p className="text-(--color-ink-500) mt-2 max-w-sm mx-auto">
            Answer a few questions and your accuracy, streak, calibration and pass-readiness
            estimate will appear here.
          </p>
          <ButtonLink href="/practice" variant="accent" size="lg" className="mt-6">
            Start practicing
          </ButtonLink>
        </div>
      ) : (
        <>
          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-10">
            <StatCard label="Overall accuracy" value={`${accuracy}%`} icon={Target} />
            <StatCard
              label="Day streak"
              value={String(streak)}
              hint={streak === 0 ? "Practice today to start one" : "Keep it going"}
              icon={Fire}
            />
            <StatCard
              label="Pass readiness"
              value={readiness !== null ? `${readiness}` : "—"}
              hint={`Estimate, based on ${total}/${READINESS_TARGET_QUESTIONS} target questions`}
              icon={Gauge}
              accent
            />
            <StatCard label="Questions answered" value={String(total)} icon={ListChecks} />
          </div>

          <div className="grid lg:grid-cols-2 gap-6">
            <section className="rounded-3xl border border-(--color-ink-100) p-6">
              <h2 className="font-display text-lg font-bold text-(--color-ink-900)">
                Calibration
              </h2>
              <p className="text-sm text-(--color-ink-500) mt-1 mb-4">
                When you said you were sure, how often were you actually right?
              </p>
              <CalibrationChart data={calibration} />
            </section>

            <section className="rounded-3xl border border-(--color-ink-100) p-6">
              <h2 className="font-display text-lg font-bold text-(--color-ink-900)">
                Performance by specialty
              </h2>
              <p className="text-sm text-(--color-ink-500) mt-1 mb-4">Weakest areas first.</p>
              <SpecialtyBreakdown stats={specialtyStats} />
            </section>

            <section className="rounded-3xl border border-(--color-ink-100) p-6 lg:col-span-2">
              <h2 className="font-display text-lg font-bold text-(--color-ink-900)">
                Why you get things wrong
              </h2>
              <p className="text-sm text-(--color-ink-500) mt-1 mb-4">
                Tagged the moment you answer incorrectly.
              </p>
              <ErrorTypeBreakdown stats={errorStats} />
            </section>
          </div>

          <p className="text-xs text-(--color-ink-500) mt-8 max-w-xl">
            Pass readiness is an estimate we compute from your accuracy, how well-calibrated your
            confidence is, and how much you&rsquo;ve practised &mdash; it is not a validated
            predictor of exam outcome.
          </p>
        </>
      )}
    </div>
  );
}
