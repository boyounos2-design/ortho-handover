-- Ortho handover (open version): run once in the Supabase SQL Editor.
-- Anyone with the page link can read, add, edit and delete cases. No sign-in.

create table if not exists public.cases (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  room text not null default '',
  age text not null default '',
  med_no text not null default '',
  phase text not null default '' check (phase in ('', 'Pre', 'Post')),
  diagnosis text not null default '',
  operation text not null default '',
  chronic text not null default '',
  labs text not null default '',
  notes text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  discharged_at timestamptz,
  constraint cases_text_len check (
    char_length(name) <= 300 and char_length(room) <= 300 and char_length(age) <= 300 and
    char_length(med_no) <= 300 and char_length(diagnosis) <= 2000 and char_length(operation) <= 2000 and
    char_length(chronic) <= 2000 and char_length(labs) <= 2000 and char_length(notes) <= 4000
  )
);

alter table public.cases enable row level security;

create policy "cases open access" on public.cases
  for all to anon, authenticated using (true) with check (true);

-- Live updates for everyone who has the page open.
alter publication supabase_realtime add table public.cases;
