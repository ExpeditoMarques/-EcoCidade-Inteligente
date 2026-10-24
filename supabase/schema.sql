-- EcoCidade Inteligente: schema inicial do banco compartilhado
-- Execute no SQL Editor do seu próprio projeto Supabase.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '',
  city text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists public.reports (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete set null,
  category text not null,
  place text not null default '',
  description text not null,
  latitude double precision,
  longitude double precision,
  photo_url text,
  status text not null default 'Pendente'
    check (status in ('Pendente','Em análise','Em andamento','Resolvida')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint reports_latitude_range check (latitude is null or latitude between -90 and 90),
  constraint reports_longitude_range check (longitude is null or longitude between -180 and 180)
);

create index if not exists reports_created_at_idx on public.reports (created_at desc);
create index if not exists reports_location_idx on public.reports (latitude, longitude);
create index if not exists reports_user_id_idx on public.reports (user_id);

alter table public.profiles enable row level security;
alter table public.reports enable row level security;

-- Perfil: cada usuário pode ler e alterar apenas o próprio perfil.
drop policy if exists "profile read own" on public.profiles;
create policy "profile read own" on public.profiles for select to authenticated using (auth.uid() = id);
drop policy if exists "profile insert own" on public.profiles;
create policy "profile insert own" on public.profiles for insert to authenticated with check (auth.uid() = id);
drop policy if exists "profile update own" on public.profiles;
create policy "profile update own" on public.profiles for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

-- Ocorrências: leitura pública para o mapa comunitário; só usuários autenticados criam relatos.
drop policy if exists "reports public read" on public.reports;
create policy "reports public read" on public.reports for select to anon, authenticated using (true);
drop policy if exists "authenticated users create reports" on public.reports;
create policy "authenticated users create reports" on public.reports for insert to authenticated with check (user_id = auth.uid());
-- Não há política pública para atualizar/excluir relatos. A administração será configurada separadamente com permissões restritas.

-- Atualização automática do campo updated_at.
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;
drop trigger if exists reports_set_updated_at on public.reports;
create trigger reports_set_updated_at before update on public.reports
for each row execute procedure public.set_updated_at();
