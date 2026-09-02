-- BANCO DE DADOS: Centauro | Inspeção de Frota
create extension if not exists pgcrypto;

create table if not exists public.inspecoes (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  data_hora timestamptz not null,
  motorista text not null,
  contrato text not null,
  veiculo text not null,
  placa text not null,
  km numeric not null default 0,
  mecanica text,
  status text not null default 'concluida'
);

create table if not exists public.inspecao_fotos (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  inspecao_id uuid not null references public.inspecoes(id) on delete cascade,
  categoria text,
  arquivo text not null
);

alter table public.inspecoes enable row level security;
alter table public.inspecao_fotos enable row level security;

-- Para uma primeira implantação sem login:
create policy "inspecoes_public_insert" on public.inspecoes
for insert to anon with check (true);

create policy "inspecoes_public_select" on public.inspecoes
for select to anon using (true);

create policy "fotos_public_insert" on public.inspecao_fotos
for insert to anon with check (true);

create policy "fotos_public_select" on public.inspecao_fotos
for select to anon using (true);

-- No Storage, crie manualmente um bucket chamado: inspecao-fotos
-- e habilite upload para anon apenas se aceitar esse modelo de segurança.
