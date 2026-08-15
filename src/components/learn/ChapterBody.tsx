import type { ChapterSection } from "@/lib/types/database";

function slugifySection(heading: string, index: number) {
  return `sec-${index}`;
}

export function ChapterToc({ sections }: { sections: ChapterSection[] }) {
  return (
    <nav aria-label="Chapter sections" className="sticky top-20 text-sm">
      <p className="text-[11px] font-extrabold tracking-wide uppercase text-(--color-ink-500) mb-2.5">
        On this page
      </p>
      <ul className="flex flex-col">
        {sections.map((s, i) => (
          <li key={i}>
            <a
              href={`#${slugifySection(s.heading, i)}`}
              className="block py-1.5 pl-3 border-l-2 border-(--color-ink-100) text-(--color-ink-500) hover:text-(--color-ink-900) font-semibold leading-tight"
            >
              {s.heading}
            </a>
          </li>
        ))}
        <li>
          <a
            href="#sec-pearls"
            className="block py-1.5 pl-3 border-l-2 border-(--color-ink-100) text-(--color-ink-500) hover:text-(--color-ink-900) font-semibold leading-tight"
          >
            Exam pearls
          </a>
        </li>
      </ul>
    </nav>
  );
}

export function ChapterBody({
  sections,
  pearls,
}: {
  sections: ChapterSection[];
  pearls: string[];
}) {
  return (
    <div className="chapter-content">
      {sections.map((s, i) => (
        <section key={i} id={slugifySection(s.heading, i)} className="max-w-[66ch] mb-8 scroll-mt-20">
          <h2 className="font-display text-lg font-extrabold text-(--color-ink-900) mb-3 flex items-center gap-2.5">
            <span className="text-(--color-teal-700) text-sm tabular-nums">
              {String(i + 1).padStart(2, "0")}
            </span>
            {s.heading}
          </h2>
          <div dangerouslySetInnerHTML={{ __html: s.body_html }} />
        </section>
      ))}

      <section id="sec-pearls" className="max-w-[66ch] scroll-mt-20">
        <h2 className="font-display text-lg font-extrabold text-(--color-ink-900) mb-3 flex items-center gap-2.5">
          <span className="text-(--color-teal-700) text-sm tabular-nums">
            {String(sections.length + 1).padStart(2, "0")}
          </span>
          Exam pearls
        </h2>
        <ul className="flex flex-col gap-2.5 list-none p-0 m-0">
          {pearls.map((p, i) => (
            <li
              key={i}
              className="flex gap-2.5 text-sm leading-relaxed p-3.5 bg-white border border-(--color-ink-100) rounded-xl"
            >
              <span className="text-(--color-teal-600) shrink-0 text-xs mt-0.5" aria-hidden="true">
                &#10022;
              </span>
              {p}
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
}
