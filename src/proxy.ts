import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

// Next.js 16 renamed Middleware to Proxy (same runtime, same API — see
// node_modules/next/dist/docs/01-app/01-getting-started/16-proxy.md).
//
// This does two jobs, per Next's recommended Supabase pattern:
// 1. Refresh the Supabase auth token on every request and write the
//    refreshed cookies back onto the response (required for @supabase/ssr).
// 2. An *optimistic* redirect for signed-out users hitting protected
//    routes, read from the cookie only — no DB round trip here. Anything
//    that needs a real authorization decision (e.g. "is this user an
//    admin?") is re-checked server-side in that route's own layout/page.

const PROTECTED_PREFIXES = ["/practice", "/dashboard", "/review", "/admin", "/settings"];

export async function proxy(request: NextRequest) {
  let supabaseResponse = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value));
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  // Do not add logic between createServerClient and getUser() — it needs to
  // run first on every request so the session stays fresh.
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const path = request.nextUrl.pathname;
  const isProtected = PROTECTED_PREFIXES.some(
    (prefix) => path === prefix || path.startsWith(`${prefix}/`)
  );

  if (isProtected && !user) {
    const url = request.nextUrl.clone();
    url.pathname = "/login";
    url.searchParams.set("next", path);
    return NextResponse.redirect(url);
  }

  return supabaseResponse;
}

export const config = {
  matcher: [
    "/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)",
  ],
};
