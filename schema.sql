-- Drzewo genealogiczne – schemat Supabase
-- Wklej w: Supabase → SQL Editor → Run
-- Potem: Authentication → Users → Add user (Twoje konto)
-- i wyłącz publiczną rejestrację: Authentication → Sign In / Providers → Email → "Allow new users to sign up" OFF

create table if not exists persons (
  id          uuid primary key default gen_random_uuid(),
  first_name  text,
  last_name   text,
  maiden_name text,
  gender      text check (gender in ('M','K')),
  birth_date  text,   -- tekst, żeby wspierać daty częściowe (np. "1923")
  birth_place text,
  death_date  text,
  death_place text,
  notes       text,
  father_id   uuid references persons(id) on delete set null,
  mother_id   uuid references persons(id) on delete set null,
  created_at  timestamptz not null default now()
);

create table if not exists unions (
  id        uuid primary key default gen_random_uuid(),
  person_a  uuid not null references persons(id) on delete cascade,
  person_b  uuid not null references persons(id) on delete cascade,
  created_at timestamptz not null default now(),
  check (person_a <> person_b)
);

create index if not exists persons_father_idx on persons(father_id);
create index if not exists persons_mother_idx on persons(mother_id);

-- Dostęp tylko dla zalogowanych użytkowników
alter table persons enable row level security;
alter table unions  enable row level security;

drop policy if exists "persons_auth_all" on persons;
drop policy if exists "unions_auth_all"  on unions;

create policy "persons_auth_all" on persons for all to authenticated using (true) with check (true);
create policy "unions_auth_all"  on unions  for all to authenticated using (true) with check (true);
