"use client";

import Link from "next/link";
import { useActionState } from "react";
import { signInWithEmail, type AuthActionState } from "@/lib/actions/auth";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";

const initialState: AuthActionState = { error: null };

export function LoginForm({ next }: { next?: string }) {
  const [state, formAction, pending] = useActionState(signInWithEmail, initialState);

  return (
    <form action={formAction} className="flex flex-col gap-4" noValidate>
      <input type="hidden" name="next" value={next ?? "/dashboard"} />
      <FormField
        label="Email"
        id="email"
        name="email"
        type="email"
        autoComplete="email"
        required
      />
      <div className="flex flex-col gap-1.5">
        <FormField
          label="Password"
          id="password"
          name="password"
          type="password"
          autoComplete="current-password"
          required
        />
        <Link
          href="/forgot-password"
          className="self-end text-sm font-semibold text-(--color-navy-900) hover:underline"
        >
          Forgot password?
        </Link>
      </div>
      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}
      <Button type="submit" disabled={pending} className="mt-1 w-full" size="lg">
        {pending ? "Signing in…" : "Sign in"}
      </Button>
    </form>
  );
}
