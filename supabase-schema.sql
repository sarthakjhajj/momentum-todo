-- Run this once in your Supabase project's SQL Editor (Database > SQL Editor > New query)

create table tasks (
  id bigint primary key,
  text text not null,
  done boolean not null default false,
  date date not null,
  difficulty text not null default 'medium',
  completed_at date
);

-- No login/auth in this app, so the anon key needs open read/write access.
-- Anyone with your project URL + anon key can read/write this table.
-- Fine for a personal single-user app; don't put anything sensitive in it.
alter table tasks enable row level security;

create policy "public read" on tasks for select using (true);
create policy "public write" on tasks for insert with check (true);
create policy "public update" on tasks for update using (true);
create policy "public delete" on tasks for delete using (true);
