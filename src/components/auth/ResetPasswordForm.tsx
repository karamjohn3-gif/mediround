"use client";

import { useActionState } from "react";
import { updatePasswordAction, type AuthActionState } from "@/lib/actions/auth";
import { FormField } from "@/components/ui/FormField";
import { Button } from "@/components/ui/Button";

const initialState: AuthActionState = { error: null };

export function ResetPasswordForm() {
  const [state, formAction, pending] = useActionState(updatePasswordAction, initialState);

  return (
    <form action={formAction} className="flex flex-col gap-4" noValidate>
      <FormField
        label="New password"
        id="password"
        name="password"
        type="password"
        autoComplete="new-password"
        hint="At least 8 characters."
        minLength={8}
        required
      />
      <FormField
        label="Confirm new password"
        id="confirmPassword"
        name="confirmPassword"
        type="password"
        autoComplete="new-password"
        minLength={8}
        required
      />
      {state.error && (
        <p role="alert" className="text-sm text-(--color-danger-700)">
          {state.error}
        </p>
      )}
      <Button type="submit" disabled={pending} className="mt-1 w-full" size="lg">
        {pending ? "Updating…" : "Update password"}
      </Button>
    </form>
  );
}
