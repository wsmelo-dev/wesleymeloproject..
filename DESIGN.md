# DESIGN.md — Portfólio Wesley Melo

Direção: editorial monocromática, técnica, com respiro. Sem card rounded, sem gradiente, sem brilho, sem cor decorativa.

## Tokens (implementados em `:root` do `index.html` e do `certificados.html`)

Claro
- `--paper #F2F2F0` (fundo) · `--paper-2 #E9E9E6` · `--paper-3 #E0E0DC` · `--surface #FAFAF8`
- `--ink #0C0C0D` · `--ink-2 #43434A` · `--ink-3 #6B6B73` (rótulos mono; mínimo WCAG AA 4.5:1 sobre `--paper` e `--surface`)
- `--line rgba(12,12,13,.16)` · `--line-soft rgba(12,12,13,.09)` · `--line-hard rgba(12,12,13,.5)`
- `--inv-bg #0C0C0D` / `--inv-ink #F2F2F0` (superfície invertida, usada nos hovers e no toast)
- `--status #2E7D5B` (verde, só como sinal)

Escuro (`[data-theme="dark"]`)
- `--paper #0B0B0D` (página, preta) · `--paper-2 #17171A` · `--paper-3 #212125`
- `--surface transparent` (no modo escuro **nenhum** cartão tem fundo)
- `--hover #161618` · `--menu #141416` · `--badge-bg #1F1F22` / `--badge-fg #F1F1EE`
- `--ink #F1F1EE` · `--ink-2 #B4B4B8` · `--ink-3 #82828A`
- `--line rgba(241,241,238,.14)` · `--inv-bg #F1F1EE` / `--inv-ink #0C0C0D`
- `--status #5FBE92`

Outros: `--max 1180px` · `--nav-h 60px` · `--ease cubic-bezier(.16,1,.3,1)` · `--font "Geist"` · `--mono "Geist Mono"`.

## Formato
- Raio **0** em superfícies, etiquetas e botões. Sem pill, sem card com sombra.
- **Sem bordas de 1px.** Nenhum contêiner, painel, etiqueta ou item de lista usa borda. A separação vem de espaço, de fundo (`--surface`, `--paper-2`) e de hierarquia tipográfica.
- **Sem fundo no hover.** Nenhuma linha de lista ganha bloco ao passar o mouse: no tema claro o realce é o branco quase imperceptível do `--surface`, no tema escuro o `--surface` é transparente e não aparece nada. Nada de "barra" atrás do texto.
- Exceções, e só estas: o sublinhado do link de projeto (é afordância de texto, não caixa) e a régua desenhada da seção de habilidades.
- Estado ativo e destaque usam **superfície invertida** (`--inv-bg` / `--inv-ink`), nunca contorno.
- Fundo com malha de pontos de 28px, mascarada no topo, atrás de tudo (`pointer-events:none`).
- Único acento: verde de status, restrito a ponto de status, indicador de disponibilidade e selo de atividade real.

## Tipografia
- Display: Geist 600, `letter-spacing -.035em` (hero `.94`), `clamp(3.2rem,9vw,6.2rem)` na hero.
- Corpo: Geist 400, `line-height 1.5`, `.lede` com `clamp(1rem,1.35vw,1.08rem)` e `max-width 64ch`.
- Rótulos técnicos: Geist Mono, `11px`, `letter-spacing .14em`, `text-transform uppercase`, cor `--ink-3`.
- Mono para números: `.clock` com `font-variant-numeric: tabular-nums`.

## Botões
- **Sem caixa.** Nenhum botão tem fundo, borda ou raio. Primário = texto em `--ink`, secundário = texto em `--ink-3`.
- A hierarquia vem do contraste do texto, não de bloco preenchido. A seta (`↓` ou `→`) desliza 3px no hover.
- Espaçamento entre os dois botões na hero: 26px, para ler como duas ações e não como um bloco.

## Estrutura
- Nav fixa (60px), marca `WM` em quadrado, links com sublinhado que cresce no hover, alternador de tema e menu hambúrguer no mobile.
- **Home, na ordem em que o visitante encontra:** Hero (nome, função, uma frase, dois botões e o painel "Resumo" com o relógio) → **Projetos** (a seção de destaque, logo depois da hero) → Sobre mim → Habilidades → Contato.
- Hero: kicker com ponto de status, nome em duas linhas (a segunda em `--ink-3`), função, lede e dois botões; à direita o painel "Resumo" (Foco, Base, Estudando, Interesse + relógio).
- Seções numeradas com grade `132px 1fr`; o número usa `--ink-3` (contraste AA, não mais marca d'água invisível).
- Projetos: card único com a **imagem do fluxo** ocupando a largura toda e, embaixo, nome, descrição de duas frases, etiquetas de tecnologia e o link "Ver mais detalhes".
- Contato: formulário (nome + mensagem, envio por e-mail preenchido) e três ícones soltos (copiar e-mail, GitHub, LinkedIn), com feedback por toast.
- **Estudo de caso:** Hero enxuto (voltar, título, uma frase, etiquetas) → *Em resumo* (4 fatos: Objetivo, Problema, Solução, Resultado) → *O fluxo na prática* (4 capturas comentadas) → *Como funciona* (7 etapas navegáveis por teclado) → *Demonstração* (a mensagem que chega) → *Desafios técnicos* (acordeão) → *Tecnologias* e *Aprendizados* → CTA final.

## Imagens do projeto
- As capturas do fluxo ficam em `assets/`, **já higienizadas**: endpoints internos, chaves de API, tokens, e-mails de clientes, nome da empresa, ids internos, telefone e nomes de certificado foram tarjados ou recortados fora.
- A página diz isso ao leitor, em nota abaixo da galeria. Nenhuma captura entra no site sem passar por esse processo.

## Movimento
- `cubic-bezier(.16,1,.3,1)`, só `transform` e `opacity`.
- Entrada: revelação por palavra na hero, `Reveal` com `translateY(18px)` nas seções, régua que desenha, barra de progresso no topo via `animation-timeline: scroll()`.
- `prefers-reduced-motion: reduce` desliga tudo e revela o conteúdo estático.

## Responsivo
- ≤940px: hero vira 1 coluna · ≤860px: seção vira 1 coluna, skills em 2 colunas, fluxo do estudo vira lista vertical · ≤720px: nav vira hambúrguer, contato em 1 coluna · ≤980px: prévia dos projetos cai abaixo do texto.

## Fora do sistema (não reintroduzir)
Vermelho saturado, glow neon, cursor customizado, cards com sombra e raio grande, gradiente em texto, badge redondo colorido como enfeite, parallax decorativo, emoji na interface.

## Controles (tema e idioma)
- Ambos são **controles segmentados** (`.seg`): dois estados lado a lado, altura 34px, sem raio, **sem borda e sem fundo**.
- O estado ativo é marcado só por **cor** (`--ink` contra `--ink-3`) e por um **ponto de 3px** embaixo do item. Nunca por bloco invertido, para não sobrar quadrado branco no modo escuro.
- Ícone de tema: sol = claro, lua = escuro, 15px, traço 1.6. Idioma: `PT` / `EN` em mono 11px.
- São dois botões de verdade (não um toggle), cada um com `aria-pressed`, então teclado e leitor de tela funcionam sem gambiarra.
- Ordem na barra: idioma, tema, menu.

## Modo escuro
- **O site abre sempre no escuro.** O script inline do `<head>` define `data-theme="dark"` antes de qualquer pintura da tela, ignorando a preferência do sistema e qualquer valor salvo. Sem flash de tema claro.
- O botão sol/lua continua funcionando durante a visita: alterna na hora e salva a escolha em `localStorage`, mas a próxima entrada volta ao escuro.
- `theme-color` do navegador é `#0B0B0D` (a cor da página escura), sem `media` condicional.
- A página é **preta** (`#0B0B0D`) e **nada** tem fundo: `--surface` é `transparent`. Ficha, painel técnico, prévia do projeto, tecnologias, notas e a própria mensagem do CRM ficam sem caixa, flutuando direto no preto.
- Regra: no escuro, se algo é cartão, ele é **transparente**. A separação vem de tipografia, espaço e os tons internos (`--paper-2`, `--paper-3`).
- Tons que continuam com fundo no escuro, e por quê: `--hover` (realce de linha ao passar o mouse), `--menu` (painel do menu mobile, precisa de fundo para ser lido), `--badge-bg` (etiqueta "EM USO", precisa contrastar) e `--inv-bg` (toast e inversões de hover).
- Chat no escuro: `--chat-box`, `--chat-wall` e `--chat-bubble` são `transparent`, então a mensagem não tem caixa nenhuma. No claro, a mensagem é branca sobre a parede cinza.
- Avatar do CRM usa `--avatar-bg` / `--avatar-fg`: `#0C0C0D` e `#F2F2F0` no claro, `#1A1A1D` e `#F1F1EE` no escuro, para não virar um quadrado branco.

## Idioma
- Português é o padrão. A escolha fica em `localStorage` (`wsm.lang`) e vale para as duas páginas, que usam a mesma chave.
- Trocar o idioma troca também `<html lang>`, `<title>` e as meta tags de descrição.
- Todo texto visível vem de um dicionário por idioma (`COPY` no `index.html`, `COPY` no `certificados.html`). Nada de string solta misturada entre os dois idiomas: **toda string da interface tem que passar pelo dicionário**, incluindo as prévias dos projetos, os `aria-label` e os `title`.
- Atributos traduzidos por marcador: `data-i18n` (texto), `data-i18n-aria` (`aria-label`) e `data-i18n-title` (`title` + `aria-label`). O dicionário aceita chave com ponto (`nav.light`) para entrar em sub-objetos.
- Termos técnicos (n8n, HTTP, JavaScript, API do CRM) não são traduzidos. O nome da própria página (Wesley Melo) também não.
- O bloco `<noscript>` fica em português por definição: sem JavaScript não há como trocar o texto.
- Como conferir: trocar para EN e varrer o texto da página em busca de palavra em português (e vice-versa). É o jeito mais rápido de achar string fixa.

## Projetos
- A linha inteira do projeto é clicável: o título é um link com `::after` esticado (`inset:0`) sobre a linha. Passar o mouse em qualquer ponto (título, descrição ou prévia) leva à demonstração, e o cursor vira pointer.
- O CTA "Ver mais detalhes" continua visível e fica acima do overlay (`z-index`), com a mesma URL e o mesmo rótulo de acessibilidade.
- **Sem fundo no hover.** A linha do projeto não ganha bloco ao passar o mouse (nada de "barreira" atrás do texto). O sinal de clicabilidade é o cursor pointer mais a seta que aparece no título.
- No hover, o título vai para `--ink` e a prévia sobe 3px.

## Publicação
Site estático no branch `main` do repositório `wsmelo-dev/wesleymelo.com`, servido no GitHub Pages em `https://wsmelo-dev.github.io/wesleymelo.com/`. O dono edita direto pelo GitHub (editor do repositório), então:
- Depois de qualquer alteração feita por agente, **sincronizar de volta**: o repositório é a fonte da verdade e a pasta local é espelho.
- Antes de aplicar uma nova alteração, **baixar a versão atual do repositório** e editar em cima dela. Assim nenhuma edição manual é perdida.
- `publicar.bat` (Git + gh CLI) e `publicar-api.bat` (API do GitHub) existem para publicar sem mexer na mão, mas sobrescrevem o repositório com a cópia local: só usar logo depois de uma alteração do agente.
- Arquivos que não devem mais existir no repositório: `foto.jpg` (retrato antigo, sem uso no site), `style.css` e `script.js` (sobraram da versão anterior e não são linkados por nada).
