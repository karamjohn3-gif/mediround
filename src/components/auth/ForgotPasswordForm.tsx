"use client";

import { useActionState } from "react";
import { requestPasswordResetAction, type AuthActionState } from "@/lib/actions/auth";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";

const initialState: AuthActionState = { error: null };

export function ForgotPasswordForm() {
  const [state, formAction, pending] = useActionState(requestPasswordResetAction, initialState);

  return (
    <form action={formAction} className="flex flex-col gap-4" noValidate>
      <FormField
        label="Email"
        id="email"
        name="email"
        type="email"
        autoComplete="email"
        required
      />
      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}
      <Button type="submit" disabled={pending} className="mt-1 w-full" size="lg">
        {pending ? "Sending…" : "Send reset link"}
      </Button>
    </form>
  );
}
