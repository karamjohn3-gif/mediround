"use client";

import { useTextSize, type TextSize } from "@/contexts/TextSizeContext";

const ORDER: TextSize[] = ["base", "lg", "xl"];

export function TextSizeControl() {
  const { textSize, setTextSize, labels } = useTextSize();

  function cycle() {
    const nextIndex = (ORDER.indexOf(textSize) + 1) % ORDER.length;
    setTextSize(ORDER[nextIndex]);
  }

  return (
    <button
      type="button"
      onClick={cycle}
      className="cursor-pointer inline-flex items-center gap-1.5 rounded-full border border-(--color-ink-200) px-3 py-1.5 text-sm font-semibold text-(--color-ink-700) hover:bg-(--color-ink-50) transition-colors"
      aria-label={`Text size: ${labels[textSize]}. Activate to change text size.`}
    >
      <span aria-hidden="true" className="text-xs">A</span>
      <span aria-hidden="true" className="text-base leading-none">A</span>
    </button>
  );
}
