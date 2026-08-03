import type { Metadata } from "next";
import { Figtree, Inter } from "next/font/google";
import { TextSizeProvider } from "@/contexts/TextSizeContext";
import { SkipLink } from "@/components/layout/SkipLink";
import { SiteHeader } from "@/components/layout/SiteHeader";
import { SiteFooter } from "@/components/layout/SiteFooter";
import "./globals.css";

const figtree = Figtree({
  variable: "--font-figtree",
  subsets: ["latin"],
  weight: ["500", "600", "700", "800"],
});

const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "MediRound — Clinical reasoning for UKMLA & MRCP",
  description:
    "A question bank built to teach clinical reasoning, not just mark answers. Practice UKMLA and MRCP Part 1 single-best-answer questions with confidence tracking, discriminator explanations and spaced repetition.",
};

// Restore the user's saved text-size preference before first paint, so the
// page never flashes at the wrong size then jumps.
const TEXT_SIZE_INIT_SCRIPT = `
(function () {
  try {
    var size = window.localStorage.getItem("mediround-text-size");
    if (size === "lg" || size === "xl") {
      document.documentElement.setAttribute("data-text-size", size);
    }
  } catch (e) {}
})();
`;

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      // Always render an explicit default so there's a real baseline value
      // for suppressHydrationWarning to reconcile against (per Next's
      // "preventing flash before hydration" guide) — the inline script
      // below overwrites this with the persisted lg/xl choice, if any,
      // before the browser paints.
      data-text-size="base"
      className={`${figtree.variable} ${inter.variable} h-full antialiased`}
      suppressHydrationWarning
    >
      <head>
        <script dangerouslySetInnerHTML={{ __html: TEXT_SIZE_INIT_SCRIPT }} />
      </head>
      <body className="min-h-full flex flex-col bg-white text-(--color-ink-900)">
        <TextSizeProvider>
          <SkipLink />
          <SiteHeader />
          <main id="main-content" className="flex-1 flex flex-col">
            {children}
          </main>
          <SiteFooter />
        </TextSizeProvider>
      </body>
    </html>
  );
}
