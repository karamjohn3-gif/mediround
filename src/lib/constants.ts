import type {
  ConfidenceLevel,
  ErrorType,
  ExamType,
  QuestionDifficulty,
} from "@/lib/types/database";

export const EXAMS: { id: ExamType; name: string; fullName: string }[] = [
  { id: "ukmla", name: "UKMLA", fullName: "UK Medical Licensing Assessment" },
  { id: "mrcp1", name: "MRCP Part 1", fullName: "MRCP UK Part 1" },
];

export const EXAM_NAMES: Record<ExamType, string> = {
  ukmla: "UKMLA",
  mrcp1: "MRCP Part 1",
};

export const DIFFICULTY_LABELS: Record<QuestionDifficulty, string> = {
  foundation: "Foundation",
  core: "Core",
  advanced: "Advanced",
};

export const CONFIDENCE_LEVELS: {
  id: ConfidenceLevel;
  label: string;
  hint: string;
  approxPercent: number;
}[] = [
  { id: "guessing", label: "Guessing", hint: "~33% sure", approxPercent: 33 },
  { id: "fairly_sure", label: "Fairly sure", hint: "~70% sure", approxPercent: 70 },
  { id: "certain", label: "Certain", hint: "~90% sure", approxPercent: 90 },
];

export const ERROR_TYPES: { id: ErrorType; label: string; description: string }[] = [
  {
    id: "knowledge_gap",
    label: "Didn't know the fact",
    description: "I hadn't learned or couldn't recall the key knowledge needed.",
  },
  {
    id: "reasoning_error",
    label: "Knew it but reasoned wrong",
    description: "I had the knowledge but applied it incorrectly to this case.",
  },
  {
    id: "misread_stem",
    label: "Misread the stem",
    description: "I missed or misread a detail in the vignette.",
  },
  {
    id: "careless_slip",
    label: "Careless slip",
    description: "I knew the answer but clicked/selected the wrong option.",
  },
];

/** Free attempts a signed-in user without an active subscription can make
 * before being asked to upgrade. Matches the 5 seeded demo questions so the
 * app is fully explorable without payment. */
export const FREE_ATTEMPT_LIMIT = 5;

export const SUBSCRIPTION_PRICE_GBP = 7;
