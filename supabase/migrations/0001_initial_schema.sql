create extension if not exists "pgcrypto";

create type public.gender as enum ('woman','man','non_binary','other');
create type public.report_reason as enum ('fake_profile','harassment','underage','spam','other');
create type public.report_status as enum ('open','reviewing','resolved','dismissed');

create table public.users (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid unique not null,
  is_active boolean not null default true,
  disabled_reason text,
  is_banned boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.profiles (
  user_id uuid primary key references public.users(id) on delete cascade,
  first_name text not null check (char_length(first_name) between 1 and 40),
  birthdate date not null,
  gender public.gender not null,
  interested_in public.gender[] not null,
  bio text not null default '' check (char_length(bio) <= 280),
  city text not null,
  latitude numeric(8,5),
  longitude numeric(8,5),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint profile_adult_only check (birthdate <= (current_date - interval '18 years'))
);

create table public.photos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  storage_path text not null unique,
  position smallint not null check (position between 1 and 4),
  created_at timestamptz not null default now(),
  unique (user_id, position)
);

create table public.matches (
  id uuid primary key default gen_random_uuid(),
  user_a_id uuid not null references public.users(id) on delete cascade,
  user_b_id uuid not null references public.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  expires_at timestamptz not null default (now() + interval '7 days'),
  expired_at timestamptz,
  cooldown_until timestamptz,
  constraint match_two_distinct_users check (user_a_id <> user_b_id),
  constraint canonical_user_order check (user_a_id < user_b_id),
  unique (user_a_id, user_b_id)
);

create index matches_user_a_idx on public.matches(user_a_id);
create index matches_user_b_idx on public.matches(user_b_id);
create index matches_expires_idx on public.matches(expires_at);

create table public.messages (
  id uuid primary key default gen_random_uuid(),
  match_id uuid not null references public.matches(id) on delete cascade,
  sender_user_id uuid not null references public.users(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now()
);

create index messages_match_created_idx on public.messages(match_id, created_at desc);

create table public.meetup_confirmations (
  id uuid primary key default gen_random_uuid(),
  match_id uuid not null unique references public.matches(id) on delete cascade,
  user_a_confirmed_at timestamptz,
  user_b_confirmed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.blocks (
  id uuid primary key default gen_random_uuid(),
  blocker_user_id uuid not null references public.users(id) on delete cascade,
  blocked_user_id uuid not null references public.users(id) on delete cascade,
  reason text,
  created_at timestamptz not null default now(),
  constraint block_two_distinct_users check (blocker_user_id <> blocked_user_id),
  unique (blocker_user_id, blocked_user_id)
);

create table public.reports (
  id uuid primary key default gen_random_uuid(),
  reporter_user_id uuid not null references public.users(id) on delete cascade,
  reported_user_id uuid not null references public.users(id) on delete cascade,
  reason public.report_reason not null,
  details text not null default '',
  status public.report_status not null default 'open',
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  reviewed_by_user_id uuid references public.users(id),
  constraint report_two_distinct_users check (reporter_user_id <> reported_user_id)
);

create index reports_status_created_idx on public.reports(status, created_at desc);

create function public.touch_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger users_touch_updated_at
before update on public.users
for each row execute procedure public.touch_updated_at();

create trigger profiles_touch_updated_at
before update on public.profiles
for each row execute procedure public.touch_updated_at();

create trigger meetup_confirmations_touch_updated_at
before update on public.meetup_confirmations
for each row execute procedure public.touch_updated_at();
