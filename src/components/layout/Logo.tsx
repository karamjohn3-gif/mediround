import Link from "next/link";
import { cn } from "@/lib/utils";
import { LogoMark } from "@/components/layout/LogoMark";

export function Logo({ className }: { className?: string }) {
  return (
    <Link
      href="/"
      className={cn(
        "inline-flex items-center gap-2 font-display font-extrabold tracking-tight text-xl shrink-0",
        className
      )}
    >
      <LogoMark className="w-9 h-9 rounded-md" />
      <span>
        <span className="text-(--color-navy-900)">Medi</span>
        <span className="text-(--color-teal-600)">Round</span>
      </span>
      <span className="sr-only">— home</span>
    </Link>
  );
}
