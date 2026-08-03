import Stripe from "stripe";

let stripeClient: Stripe | null = null;

/** Lazily constructed so importing this module never throws when
 * STRIPE_SECRET_KEY isn't set yet (e.g. during `next build`). */
export function getStripe(): Stripe {
  if (!stripeClient) {
    stripeClient = new Stripe(process.env.STRIPE_SECRET_KEY!, {
      apiVersion: "2026-06-24.dahlia",
    });
  }
  return stripeClient;
}
