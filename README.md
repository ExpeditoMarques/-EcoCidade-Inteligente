# 🌿 EcoCidade Inteligente

**Tecnologia que cuida do planeta.**

O EcoCidade Inteligente é um protótipo de aplicativo web comunitário para incentivar a sustentabilidade, registrar ocorrências ambientais e visualizar relatos com localização em um mapa.

## ✨ Funcionalidades

- **Início:** atalhos para as principais áreas do projeto.
- **Registro de ocorrências:** descrição de problemas ambientais, categoria e local aproximado.
- **Localização opcional:** permite solicitar a localização do dispositivo, mediante autorização do usuário.
- **Mapa ambiental:** exibe marcadores para ocorrências com coordenadas registradas.
- **Lista de ocorrências:** consulta os relatos salvos no navegador.
- **Guia ecológico:** dicas sobre reciclagem, economia de água, áreas verdes e prevenção de queimadas.
- **Ações comunitárias:** sugestões de atividades de sustentabilidade.
- **Layout responsivo:** interface adaptável a celulares e computadores.

## 🧰 Tecnologias

- HTML5
- CSS3
- JavaScript
- [Leaflet](https://leafletjs.com/) para o mapa
- [OpenStreetMap](https://www.openstreetmap.org/) para os dados de mapa

## 🚀 Como executar

### Opção 1 — Abrir no computador

1. Baixe ou clone este repositório.
2. Abra o arquivo `index.html` em um navegador atualizado.
3. Mantenha a conexão com a internet para carregar os recursos do mapa.

### Opção 2 — Publicar com GitHub Pages

1. Abra as configurações do repositório no GitHub.
2. Acesse **Pages**.
3. Em **Build and deployment**, selecione **Deploy from a branch**.
4. Escolha a branch `main` e a pasta `/(root)`.
5. Salve e aguarde a publicação.

Depois que o GitHub Pages estiver ativo, o endereço costuma seguir este formato:

`https://expeditomarques.github.io/-EcoCidade-Inteligente/`

## 📍 Como registrar uma ocorrência

1. Abra a área **Registrar**.
2. Selecione o tipo de problema ambiental.
3. Informe o local aproximado e descreva o que aconteceu.
4. Se desejar, clique em **Usar minha localização** e autorize o acesso no navegador.
5. Clique em **Salvar relato**.
6. Consulte o relato em **Ocorrências** e veja no **Mapa** os registros que têm coordenadas.

A localização é opcional. Não se coloque em risco para registrar uma ocorrência.

## ⚠️ Limitações atuais

Este projeto é um **protótipo demonstrativo**:

- Os registros são salvos no armazenamento local do navegador (`localStorage`).
- Os relatos não são compartilhados entre usuários ou dispositivos.
- Os registros não são enviados automaticamente à prefeitura, aos serviços de emergência ou a outros órgãos.
- O Firebase, autenticação de usuários, banco de dados em nuvem e painel administrativo ainda não estão integrados.
- O acesso à localização depende da permissão do usuário e do suporte do navegador; geralmente funciona melhor em HTTPS ou localhost.
- O mapa e os recursos externos precisam de conexão com a internet.

**Não use este protótipo como canal oficial para denúncias urgentes.** Em situações de risco, procure os serviços públicos competentes.

## 🔒 Privacidade

Antes de usar a localização, o navegador deve solicitar autorização. O usuário pode optar por não compartilhar coordenadas. Como os dados são armazenados localmente, limpar os dados do site ou do navegador pode apagar os relatos salvos.

Não registre informações pessoais sensíveis nas descrições.

## 🌱 Objetivo

Promover a participação comunitária, a educação ambiental e a conscientização sobre práticas sustentáveis por meio de uma interface simples e acessível.

## 📄 Licença

Nenhuma licença específica foi definida ainda. Consulte o responsável pelo projeto antes de reutilizar ou redistribuir o código.

---

Desenvolvido como protótipo comunitário de sustentabilidade.
