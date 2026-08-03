import Link from "next/link";
import type { Metadata } from "next";
import { ForgotPasswordForm } from "@/components/auth/ForgotPasswordForm";
import { Logo } from "@/components/layout/Logo";

export const metadata: Metadata = { title: "Reset your password — MediRound" };

export default async function ForgotPasswordPage({
  searchParams,
}: {
  searchParams: Promise<{ sent?: string }>;
}) {
  const { sent } = await searchParams;

  return (
    <div className="flex-1 flex items-center justify-center px-4 py-16 bg-(--color-navy-50)">
      <div className="w-full max-w-md bg-white rounded-3xl border border-(--color-ink-100) shadow-sm p-8 sm:p-10">
        <div className="flex justify-center mb-6">
          <Logo />
        </div>
        <h1 className="font-display text-2xl font-bold text-center text-(--color-ink-900)">
          Reset your password
        </h1>
        <p className="text-center text-(--color-ink-500) mt-1.5 mb-6">
          Enter your email and we&rsquo;ll send you a reset link.
        </p>

        {sent ? (
          <p
            role="status"
            className="rounded-xl bg-(--color-teal-50) text-(--color-teal-700) px-4 py-3 text-sm"
          >
            If an account exists for that email, a password reset link is on its way. Check your
            inbox.
          </p>
        ) : (
          <ForgotPasswordForm />
        )}

        <p className="text-center text-sm text-(--color-ink-500) mt-6">
          <Link href="/login" className="font-semibold text-(--color-navy-900) hover:underline">
            Back to sign in
          </Link>
        </p>
      </div>
    </div>
  );
}
