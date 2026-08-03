import Link from "next/link";
import type { Metadata } from "next";
import { LoginForm } from "@/components/auth/LoginForm";
import { GoogleSignInButton } from "@/components/auth/GoogleSignInButton";
import { Logo } from "@/components/layout/Logo";

export const metadata: Metadata = { title: "Sign in — MediRound" };

export default async function LoginPage({
  searchParams,
}: {
  searchParams: Promise<{ next?: string; confirmEmail?: string; error?: string }>;
}) {
  const { next, confirmEmail, error } = await searchParams;

  return (
    <div className="flex-1 flex items-center justify-center px-4 py-16 bg-(--color-navy-50)">
      <div className="w-full max-w-md bg-white rounded-3xl border border-(--color-ink-100) shadow-sm p-8 sm:p-10">
        <div className="flex justify-center mb-6">
          <Logo />
        </div>
        <h1 className="font-display text-2xl font-bold text-center text-(--color-ink-900)">
          Welcome back
        </h1>
        <p className="text-center text-(--color-ink-500) mt-1.5 mb-6">
          Sign in to continue your revision.
        </p>

        {confirmEmail && (
          <p
            role="status"
            className="mb-6 rounded-xl bg-(--color-teal-50) text-(--color-teal-700) px-4 py-3 text-sm"
          >
            Check your inbox to confirm your email, then sign in below.
          </p>
        )}
        {error && (
          <p
            role="alert"
            className="mb-6 rounded-xl bg-(--color-danger-50) text-(--color-danger-700) px-4 py-3 text-sm"
          >
            Something went wrong signing you in. Please try again.
          </p>
        )}

        <div className="mb-6">
          <GoogleSignInButton next={next ?? "/dashboard"} />
        </div>

        <div className="flex items-center gap-3 mb-6" role="separator">
          <div className="h-px flex-1 bg-(--color-ink-100)" />
          <span className="text-xs uppercase tracking-wide text-(--color-ink-500)">or</span>
          <div className="h-px flex-1 bg-(--color-ink-100)" />
        </div>

        <LoginForm next={next} />

        <p className="text-center text-sm text-(--color-ink-500) mt-6">
          New to MediRound?{" "}
          <Link href="/signup" className="font-semibold text-(--color-navy-900) hover:underline">
            Create an account
          </Link>
        </p>
      </div>
    </div>
  );
}
