-- EcoCidade Inteligente: permissões administrativas
-- Execute este arquivo no SQL Editor do Supabase.
-- Depois, marque somente a conta confiável como administradora usando o bloco final.
-- A função auth.jwt() lê app_metadata, que o usuário comum não pode alterar sozinho.

-- Administradores podem ver os perfis da comunidade.
drop policy if exists "admin read all profiles" on public.profiles;
create policy "admin read all profiles"
on public.profiles for select to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

-- Administradores podem atualizar o status e os campos permitidos da ocorrência.
drop policy if exists "admin update reports" on public.reports;
create policy "admin update reports"
on public.reports for update to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin')
with check ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

-- Administradores podem excluir ocorrências compartilhadas.
drop policy if exists "admin delete reports" on public.reports;
create policy "admin delete reports"
on public.reports for delete to authenticated
using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');

-- IMPORTANTE: depois de executar as políticas acima, substitua o e-mail abaixo
-- pelo e-mail da sua conta e execute este comando separado para conceder o papel.
-- Execute somente para uma conta confiável. Nunca coloque service_role/secret key no HTML.
--
-- update auth.users
-- set raw_app_meta_data = coalesce(raw_app_meta_data, '{}'::jsonb) || '{"role":"admin"}'::jsonb
-- where email = 'SEU-EMAIL-AQUI';
--
-- Depois, saia da conta e entre novamente no site para renovar a sessão/token.
