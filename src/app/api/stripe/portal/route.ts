import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { getStripe } from "@/lib/stripe";

function siteUrl(request: Request) {
  return process.env.NEXT_PUBLIC_SITE_URL ?? new URL(request.url).origin;
}

// Sends an already-subscribed user to the Stripe-hosted billing portal so
// they can update their card or cancel — no custom billing UI required.
export async function POST(request: Request) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  const base = siteUrl(request);

  if (!user) {
    return NextResponse.redirect(`${base}/login?next=/settings`, 303);
  }

  const { data: profile } = await supabase
    .from("profiles")
    .select("stripe_customer_id")
    .eq("id", user.id)
    .single();

  if (!profile?.stripe_customer_id) {
    return NextResponse.redirect(`${base}/pricing`, 303);
  }

  const stripe = getStripe();
  const session = await stripe.billingPortal.sessions.create({
    customer: profile.stripe_customer_id,
    return_url: `${base}/settings`,
  });

  return NextResponse.redirect(session.url, 303);
}
