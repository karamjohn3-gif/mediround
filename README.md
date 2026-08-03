# MediRound

A question bank for UK medical students sitting the **UKMLA** and **MRCP Part 1**,
built around clinical reasoning rather than just marking answers right or wrong: state your
confidence before answering, then see exactly why every wrong option was ruled out.

**Stack:** Next.js 16 (App Router) + React 19 + TypeScript · Tailwind CSS v4 · Supabase
(Postgres, email + Google auth, RLS) · Stripe (single £7/month subscription) · FSRS
spaced repetition (`ts-fsrs`) · Netlify.

## What's built

- **Practice flow** — pick an exam and topic, answer single-best-answer questions with a
  5-option vignette, state confidence (Guessing / Fairly sure / Certain) before submitting,
  then see the correct answer, a "ruled out because…" rationale for every wrong option, and
  2–3 discriminators. Wrong answers prompt an error-type tag (didn't know / reasoned wrong /
  misread stem / careless slip).
- **Dashboard** — accuracy by specialty, day streak, a calibration chart (stated confidence vs.
  actual accuracy), an estimated pass-readiness score, and a breakdown of why you get things
  wrong.
- **Review queue** — an FSRS-scheduled spaced-repetition queue; every attempt anywhere in the
  app (not just here) reschedules that question.
- **Admin tool** (`/admin`, requires `profiles.role = 'admin'`) — create and edit questions in
  the full format: stem, lead-in, 5 options with per-option rationale, discriminators, exam,
  topic, difficulty, tags, draft/published status.
- **Accessibility** — full keyboard navigation, WCAG 2.2 AA-checked color contrast, skip link,
  screen-reader labels and a live announcement on answer reveal, a user-adjustable text-size
  setting, `prefers-reduced-motion` support.
- **5 seeded example questions** (see the content note below) so the app is usable immediately.

## Local setup

### 1. Install dependencies

```bash
npm install
cp .env.example .env.local
```

### 2. Create a Supabase project

1. Create a project at [supabase.com](https://supabase.com).
2. In the SQL Editor, run every file in `supabase/migrations/` **in numeric order**, then run
   **`supabase/seed.sql`** last, to create the schema, RLS policies, the MRCP Part 1
   topic/specialty structure (one topic per blueprint specialty), and the 5 example questions.
   On a fresh project the migrations that reassign/relabel/consolidate existing rows (0002,
   0003, 0004) are effectively no-ops beyond their schema changes, since `seed.sql` inserts the
   final correct data directly — they matter for upgrading an already-running project.
3. From **Project Settings → API**, copy into `.env.local`:
   - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon` `public` key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `service_role` key → `SUPABASE_SERVICE_ROLE_KEY` (server-only — used by the Stripe
     webhook to write subscription status; never expose this to the browser)

### 3. Enable Google sign-in

1. In [Google Cloud Console](https://console.cloud.google.com), create an OAuth 2.0 Client ID
   (Web application).
2. Add authorized redirect URI: `https://<your-project-ref>.supabase.co/auth/v1/callback`.
3. In Supabase: **Authentication → Providers → Google**, paste the client ID/secret and enable it.
4. In **Authentication → URL Configuration**, add your site URL and
   `<site-url>/auth/callback` as a redirect URL (do this for both local
   `http://localhost:3000` and your production Netlify URL).

### 4. Set up Stripe

1. In test mode, create a Product ("MediRound subscription") with a recurring **£7/month** Price.
2. Copy the Price ID into `STRIPE_PRICE_ID`, and your API keys into `STRIPE_SECRET_KEY` /
   `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`.
3. For local testing, run `stripe listen --forward-to localhost:3000/api/stripe/webhook` and
   put the printed `whsec_...` into `STRIPE_WEBHOOK_SECRET`. In production, create a webhook
   endpoint in the Stripe Dashboard pointing at `https://<your-site>/api/stripe/webhook`,
   subscribed to `checkout.session.completed`, `customer.subscription.created`,
   `customer.subscription.updated`, and `customer.subscription.deleted`.

### 5. Run it

```bash
npm run dev
```

### 6. Make yourself an admin

Sign up in the app first, then in the Supabase SQL Editor:

```sql
update profiles set role = 'admin' where email = 'you@example.com';
```

`/admin` is now reachable and lets you create/edit questions without touching SQL directly.

## Deploying to Netlify

`netlify.toml` and `@netlify/plugin-nextjs` are already configured — connect the repo in
Netlify, set the same environment variables from `.env.local` (with `NEXT_PUBLIC_SITE_URL` set
to your real Netlify URL) in **Site configuration → Environment variables**, and deploy. Update
the Stripe webhook endpoint and Supabase redirect URLs to point at the production URL once it's
live.

## A note on the seeded content

The 5 example questions in `supabase/seed.sql` are illustrative teaching cases written to
exercise the app end-to-end — they are **not** mapped to the current UKMLA/MRCP curricula
or blueprint weighting, and haven't been reviewed by a clinician or medical educator. Have a
doctor or med-ed specialist review and substantially expand the bank before using this with real
students.

## Known limitations / next steps

- The admin tool lets you pick from existing topics but doesn't yet manage topics themselves —
  add new topics directly in Supabase (`topics` table) for now.
- The free-attempt limit (5 questions, `FREE_ATTEMPT_LIMIT` in `src/lib/constants.ts`) is
  enforced both in the UI and inside the `submit_attempt` Postgres function — keep both in sync
  if you change it.
- `question_options`/`question_discriminators` are intentionally locked down (admin-only SELECT
  on the base tables) so the answer key can't be read via a direct API call before a question is
  answered — the practice UI only ever sees them through the `question_options_public` view and
  the `submit_attempt()` RPC response. Keep new features going through those, not the base tables.
