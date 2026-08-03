import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { TopicForm } from "@/components/admin/TopicForm";
import { AdminNav } from "@/components/admin/AdminNav";

export const metadata: Metadata = { title: "Edit topic — MediRound" };

export default async function EditTopicPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();
  const { data: topic } = await supabase.from("topics").select("*").eq("id", id).single();

  if (!topic) notFound();

  return (
    <>
      <AdminNav active="topics" />
      <h1 className="font-display text-3xl font-extrabold text-(--color-ink-900) mb-8">
        Edit topic
      </h1>
      <TopicForm initial={topic} />
    </>
  );
}
