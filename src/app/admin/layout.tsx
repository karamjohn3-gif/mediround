import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

// Optimistic auth (is there a session at all?) happens in proxy.ts for
// every /admin/* request. This is the "secure" check per Next's
// recommended DAL pattern — a real DB read of the role, re-verified on
// every render, since role is exactly the kind of thing a stale cookie
// shouldn't be trusted for.
export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/login?next=/admin");

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile?.role !== "admin") redirect("/");

  return <div className="mx-auto max-w-5xl px-4 sm:px-6 py-10 sm:py-14 w-full">{children}</div>;
}
