import { Sparkle } from "@phosphor-icons/react/dist/ssr/Sparkle";

export function DiscriminatorsPanel({
  discriminators,
}: {
  discriminators: { id: string; discriminator_text: string }[];
}) {
  if (discriminators.length === 0) return null;

  return (
    <div className="rounded-2xl border border-(--color-teal-100) bg-(--color-teal-50) p-5">
      <h2 className="flex items-center gap-2 font-display font-bold text-(--color-teal-800)">
        <Sparkle size={18} weight="fill" aria-hidden="true" />
        Key discriminators
      </h2>
      <p className="text-sm text-(--color-teal-800)/80 mt-1 mb-3">
        The features that separate this diagnosis from its mimics.
      </p>
      <ul className="flex flex-col gap-2">
        {discriminators.map((d) => (
          <li key={d.id} className="flex gap-2.5 text-(--color-ink-800) text-sm leading-relaxed">
            <span aria-hidden="true" className="text-(--color-teal-600) font-bold">
              &bull;
            </span>
            {d.discriminator_text}
          </li>
        ))}
      </ul>
    </div>
  );
}
