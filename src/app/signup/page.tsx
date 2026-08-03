import Link from "next/link";
import type { Metadata } from "next";
import { SignupForm } from "@/components/auth/SignupForm";
import { GoogleSignInButton } from "@/components/auth/GoogleSignInButton";
import { Logo } from "@/components/layout/Logo";

export const metadata: Metadata = { title: "Create your account — MediRound" };

export default function SignupPage() {
  return (
    <div className="flex-1 flex items-center justify-center px-4 py-16 bg-(--color-navy-50)">
      <div className="w-full max-w-md bg-white rounded-3xl border border-(--color-ink-100) shadow-sm p-8 sm:p-10">
        <div className="flex justify-center mb-6">
          <Logo />
        </div>
        <h1 className="font-display text-2xl font-bold text-center text-(--color-ink-900)">
          Create your account
        </h1>
        <p className="text-center text-(--color-ink-500) mt-1.5 mb-6">
          5 questions free, no card required.
        </p>

        <div className="mb-6">
          <GoogleSignInButton next="/dashboard" />
        </div>

        <div className="flex items-center gap-3 mb-6" role="separator">
          <div className="h-px flex-1 bg-(--color-ink-100)" />
          <span className="text-xs uppercase tracking-wide text-(--color-ink-500)">or</span>
          <div className="h-px flex-1 bg-(--color-ink-100)" />
        </div>

        <SignupForm />

        <p className="text-center text-sm text-(--color-ink-500) mt-6">
          Already have an account?{" "}
          <Link href="/login" className="font-semibold text-(--color-navy-900) hover:underline">
            Sign in
          </Link>
        </p>
      </div>
    </div>
  );
}
