# Migração do EcoCidade Inteligente para Firebase

O arquivo `index.html` foi atualizado para usar Firebase Authentication e Cloud Firestore, removendo a dependência de Supabase no código do site.

- Coleção de ocorrências: `ocorrencias`
- Coleção de perfis: `perfis/{uid}`
- Login: Firebase Authentication com e-mail/senha
- Criação de ocorrência: exige usuário autenticado
- Leitura de ocorrências: pública
- Alteração/exclusão de ocorrências: exige a custom claim `admin: true`

## Configuração obrigatória no Firebase Console

1. Em **Authentication → Método de login**, habilite **E-mail/senha**. Até isso ser ativado, login e cadastro não funcionarão.
2. Em **Firestore Database → Regras**, copie o conteúdo do arquivo `firestore.rules` e clique em **Publicar**.
3. Crie a conta `expeditomar28@gmail.com` em Authentication, se ainda não existir.
4. A conta administrativa precisa receber a custom claim `admin: true` por um ambiente confiável usando o Firebase Admin SDK. Depois, saia e entre novamente no site para renovar o token.

## Segurança do administrador

Nunca coloque credenciais de conta de serviço, chaves privadas ou Firebase Admin SDK no `index.html`, em arquivos públicos do GitHub ou no navegador. A custom claim não pode ser concedida pelo próprio usuário no site. Ela deve ser configurada por um administrador do projeto, em ambiente confiável, após conferir o usuário correto.

## Limitações desta primeira etapa

- Os relatos antigos que existiam somente em `localStorage` permanecem no navegador e não são enviados automaticamente ao Firestore.
- Documentos de teste antigos com nomes de campos diferentes podem aparecer com dados parciais e não são convertidos automaticamente.
- O formulário temporariamente não aceita fotos. Para reativar fotos, configure Firebase Storage e regras próprias.
- Publicar `firestore.rules` no GitHub não publica as regras no Firebase. Elas devem ser aplicadas no Console do Firebase ou via Firebase CLI.
- Para reduzir abuso antes de abrir amplamente ao público, configure Firebase App Check e considere controles adicionais contra spam.
