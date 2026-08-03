import type { Metadata } from "next";
import { TopicForm } from "@/components/admin/TopicForm";
import { AdminNav } from "@/components/admin/AdminNav";

export const metadata: Metadata = { title: "New topic — MediRound" };

export default function NewTopicPage() {
  return (
    <>
      <AdminNav active="topics" />
      <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900) mb-8">
        New topic
      </h1>
      <TopicForm />
    </>
  );
}
