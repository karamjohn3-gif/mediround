import { cn } from "@/lib/utils";
import Link from "next/link";
import type { ComponentPropsWithoutRef, ComponentPropsWithRef } from "react";

const VARIANTS = {
  primary:
    "bg-(--color-navy-900) text-white hover:bg-(--color-navy-800) focus-visible:bg-(--color-navy-800)",
  // teal-500 fails WCAG AA (2.9:1) for white text — teal-700 keeps the
  // brand accent while giving white text a safe 5.5:1 contrast ratio.
  accent:
    "bg-(--color-teal-700) text-white hover:bg-(--color-teal-800) focus-visible:bg-(--color-teal-800)",
  outline:
    "border-2 border-(--color-navy-900) text-(--color-navy-900) bg-transparent hover:bg-(--color-navy-50)",
  ghost:
    "bg-transparent text-(--color-navy-900) hover:bg-(--color-navy-50)",
  danger:
    "bg-(--color-danger-600) text-white hover:bg-(--color-danger-700)",
} as const;

const SIZES = {
  sm: "text-sm px-3 py-1.5 gap-1.5",
  md: "text-base px-4 py-2.5 gap-2",
  lg: "text-lg px-6 py-3.5 gap-2.5",
} as const;

type BaseProps = {
  variant?: keyof typeof VARIANTS;
  size?: keyof typeof SIZES;
  className?: string;
};

const baseClasses =
  "inline-flex items-center justify-center rounded-full font-semibold cursor-pointer transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed disabled:pointer-events-none";

export function Button({
  variant = "primary",
  size = "md",
  className,
  ref,
  ...props
}: BaseProps & ComponentPropsWithRef<"button">) {
  return (
    <button
      ref={ref}
      className={cn(baseClasses, VARIANTS[variant], SIZES[size], className)}
      {...props}
    />
  );
}

export function ButtonLink({
  variant = "primary",
  size = "md",
  className,
  href,
  ...props
}: BaseProps & ComponentPropsWithoutRef<typeof Link>) {
  return (
    <Link
      href={href}
      className={cn(baseClasses, VARIANTS[variant], SIZES[size], className)}
      {...props}
    />
  );
}
