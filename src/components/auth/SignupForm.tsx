"use client";

import { useActionState } from "react";
import { signUpWithEmail, type AuthActionState } from "@/lib/actions/auth";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";

const initialState: AuthActionState = { error: null };

export function SignupForm() {
  const [state, formAction, pending] = useActionState(signUpWithEmail, initialState);

  return (
    <form action={formAction} className="flex flex-col gap-4" noValidate>
      <FormField label="Full name" id="displayName" name="displayName" autoComplete="name" />
      <FormField
        label="Email"
        id="email"
        name="email"
        type="email"
        autoComplete="email"
        required
      />
      <FormField
        label="Password"
        id="password"
        name="password"
        type="password"
        autoComplete="new-password"
        hint="At least 8 characters."
        minLength={8}
        required
      />
      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}
      <Button type="submit" disabled={pending} className="mt-1 w-full" size="lg">
        {pending ? "Creating account…" : "Create account"}
      </Button>
    </form>
  );
}
