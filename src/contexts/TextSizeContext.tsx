"use client";

import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
} from "react";

export type TextSize = "base" | "lg" | "xl";

const STORAGE_KEY = "mediround-text-size";

const LABELS: Record<TextSize, string> = {
  base: "Default",
  lg: "Large",
  xl: "Extra large",
};

type TextSizeContextValue = {
  textSize: TextSize;
  setTextSize: (size: TextSize) => void;
  labels: typeof LABELS;
};

const TextSizeContext = createContext<TextSizeContextValue | null>(null);

function applyTextSize(size: TextSize) {
  // Always set (never remove) so the attribute matches the always-present
  // default the server renders in layout.tsx — see the suppressHydrationWarning
  // note there.
  document.documentElement.setAttribute("data-text-size", size);
}

export function TextSizeProvider({ children }: { children: React.ReactNode }) {
  const [textSize, setTextSizeState] = useState<TextSize>("base");

  useEffect(() => {
    // Deliberate one-time sync from an external store (localStorage) that
    // isn't available during SSR, so the server-rendered "base" default
    // can't be computed correctly up front — the standard exception to
    // "don't setState in an effect" (see next-themes for the same pattern).
    const stored = window.localStorage.getItem(STORAGE_KEY) as TextSize | null;
    if (stored === "lg" || stored === "xl") {
      // eslint-disable-next-line react-hooks/set-state-in-effect
      setTextSizeState(stored);
    }
  }, []);

  const setTextSize = useCallback((size: TextSize) => {
    setTextSizeState(size);
    window.localStorage.setItem(STORAGE_KEY, size);
    applyTextSize(size);
  }, []);

  return (
    <TextSizeContext.Provider value={{ textSize, setTextSize, labels: LABELS }}>
      {children}
    </TextSizeContext.Provider>
  );
}

export function useTextSize() {
  const ctx = useContext(TextSizeContext);
  if (!ctx) {
    throw new Error("useTextSize must be used within a TextSizeProvider");
  }
  return ctx;
}
