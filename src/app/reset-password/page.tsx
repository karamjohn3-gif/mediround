import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { ResetPasswordForm } from "@/components/auth/ResetPasswordForm";
import { Logo } from "@/components/layout/Logo";

export const metadata: Metadata = { title: "Set a new password — MediRound" };

export default async function ResetPasswordPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Reached without a valid recovery session (expired/reused link, or
  // direct navigation) — send them back to request a fresh one.
  if (!user) redirect("/forgot-password");

  return (
    <div className="flex-1 flex items-center justify-center px-4 py-16 bg-(--color-navy-50)">
      <div className="w-full max-w-md bg-white rounded-3xl border border-(--color-ink-100) shadow-sm p-8 sm:p-10">
        <div className="flex justify-center mb-6">
          <Logo />
        </div>
        <h1 className="font-display text-2xl font-bold text-center text-(--color-ink-900)">
          Set a new password
        </h1>
        <p className="text-center text-(--color-ink-500) mt-1.5 mb-6">
          Choose a new password for your account.
        </p>
        <ResetPasswordForm />
      </div>
    </div>
  );
}
