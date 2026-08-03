"use client";

import { useEffect, useRef, useState } from "react";
import { QuestionVignette } from "@/components/practice/QuestionVignette";
import { OptionsList } from "@/components/practice/OptionsList";
import { ConfidenceSelector } from "@/components/practice/ConfidenceSelector";
import { DiscriminatorsPanel } from "@/components/practice/DiscriminatorsPanel";
import { ErrorTypePrompt } from "@/components/practice/ErrorTypePrompt";
import { SessionSummary, type SessionAttemptRecord } from "@/components/practice/SessionSummary";
import { UpgradePrompt } from "@/components/practice/UpgradePrompt";
import { Button } from "@/components/ui/Button";
import { submitAttemptAction, recordErrorTypeAction } from "@/lib/actions/practice";
import { updateFsrsStateAction } from "@/lib/actions/fsrs";
import type { ConfidenceLevel, ErrorType } from "@/lib/types/database";
import type { PracticeQuestion, SubmitAttemptResult } from "@/lib/types/domain";

type Phase = "answering" | "revealed" | "summary" | "upgrade";

export function SessionRunner({
  questions,
  examName,
  mode = "practice",
}: {
  questions: PracticeQuestion[];
  examName: string;
  mode?: "practice" | "review";
}) {
  const [index, setIndex] = useState(0);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [confidence, setConfidence] = useState<ConfidenceLevel | null>(null);
  const [phase, setPhase] = useState<Phase>("answering");
  const [reveal, setReveal] = useState<SubmitAttemptResult | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const [submitError, setSubmitError] = useState<string | null>(null);
  const [history, setHistory] = useState<SessionAttemptRecord[]>([]);
  // Set for real in the effect below (Date.now() is impure — can't seed a
  // ref with it directly during render).
  const startTimeRef = useRef(0);
  const nextButtonRef = useRef<HTMLButtonElement>(null);

  const question = questions[index];
  const isLast = index === questions.length - 1;

  useEffect(() => {
    startTimeRef.current = Date.now();
  }, [index]);

  useEffect(() => {
    if (phase === "revealed") {
      nextButtonRef.current?.focus();
    }
  }, [phase]);

  async function handleSubmit() {
    if (!selectedOptionId || submitting) return;
    setSubmitting(true);
    setSubmitError(null);
    const timeTakenSeconds = (Date.now() - startTimeRef.current) / 1000;

    const result = await submitAttemptAction(
      question.id,
      selectedOptionId,
      confidence,
      timeTakenSeconds
    );

    setSubmitting(false);

    if (!result.ok) {
      if (result.error === "free_limit_reached") {
        setPhase("upgrade");
      } else {
        setSubmitError(result.message);
      }
      return;
    }

    setReveal(result.data);
    setHistory((h) => [...h, { isCorrect: result.data.is_correct, confidence }]);
    setPhase("revealed");
    void updateFsrsStateAction(question.id, result.data.is_correct, confidence);
  }

  function handleErrorType(type: ErrorType) {
    if (reveal) {
      void recordErrorTypeAction(reveal.attempt_id, type);
    }
  }

  function handleNext() {
    if (isLast) {
      setPhase("summary");
      return;
    }
    setIndex((i) => i + 1);
    setSelectedOptionId(null);
    setConfidence(null);
    setReveal(null);
    setPhase("answering");
  }

  if (phase === "upgrade") {
    return <UpgradePrompt />;
  }

  if (phase === "summary") {
    const primaryAction =
      mode === "review"
        ? { href: "/review", label: "Back to review queue" }
        : { href: `/practice/${history.length > 0 ? questions[0].exam : ""}`, label: "Practice again" };
    return <SessionSummary attempts={history} primaryAction={primaryAction} />;
  }

  const canSubmit = !!selectedOptionId;

  return (
    <div className="flex flex-col gap-6">
      <div role="status" aria-live="polite" className="sr-only">
        {phase === "revealed" && reveal
          ? reveal.is_correct
            ? "Correct."
            : "Incorrect."
          : ""}
      </div>

      <div
        role="progressbar"
        aria-valuenow={index + 1}
        aria-valuemin={1}
        aria-valuemax={questions.length}
        aria-label={`${examName} session progress`}
        className="h-1.5 w-full rounded-full bg-(--color-ink-100) overflow-hidden"
      >
        <div
          className="h-full bg-(--color-teal-600) transition-all duration-300"
          style={{ width: `${((index + 1) / questions.length) * 100}%` }}
        />
      </div>

      <QuestionVignette
        stem={question.stem}
        leadIn={question.lead_in}
        topicName={question.topic.name}
        difficulty={question.difficulty}
        questionNumber={index + 1}
        totalQuestions={questions.length}
      />

      <OptionsList
        options={question.options}
        selectedOptionId={selectedOptionId}
        onChange={setSelectedOptionId}
        disabled={phase === "revealed"}
        reveal={reveal}
      />

      {phase === "answering" && (
        <>
          <ConfidenceSelector value={confidence} onChange={setConfidence} name="confidence" />
          {submitError && (
            <p role="alert" className="text-sm text-(--color-danger-700)">
              {submitError}
            </p>
          )}
          <Button
            onClick={handleSubmit}
            disabled={!canSubmit || submitting}
            size="lg"
            className="self-start"
          >
            {submitting ? "Checking…" : "Submit answer"}
          </Button>
        </>
      )}

      {phase === "revealed" && reveal && (
        <div className="flex flex-col gap-5">
          <DiscriminatorsPanel discriminators={reveal.discriminators ?? []} />
          {!reveal.is_correct && <ErrorTypePrompt onSelect={handleErrorType} />}
          <Button ref={nextButtonRef} onClick={handleNext} size="lg" className="self-start">
            {isLast ? "See session summary" : "Next question"}
          </Button>
        </div>
      )}
    </div>
  );
}
