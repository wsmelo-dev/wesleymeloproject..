# PRODUCT.md — Wesley Melo · Portfólio

Fonte de verdade do produto e do design system. Se algo no código divergir deste documento, o documento vence — ou o documento é atualizado com uma decisão explícita.

---

## 1. O produto

Portfólio pessoal de **Wesley Melo**, auxiliar de helpdesk e sistemas que automatiza processos com n8n e estuda programação.

Não é uma landing page de agência nem um currículo em HTML. É um **manual técnico de operações**: um registro de como o trabalho é feito, com método, evidência e limites declarados.

### Para quem
- Quem contrata suporte/infra e quer saber se a pessoa resolve problema de verdade.
- Quem precisa automatizar um processo e procura alguém que entenda dados, regras e integração.
- Quem lê portfólio técnico e avalia raciocínio, não só resultado.

### Superfícies
| Arquivo | Papel |
|---|---|
| `index.html` | Home: abertura, projeto em uso, sobre, habilidades, contato |
| `certificados.html` | Estudo de caso do fluxo de certificados (página própria) |

### Modo de leitura
**Experience** (o artefato conduz): o conteúdo e as capturas reais são a peça central; a interface recua.

### Voz
Português do Brasil, direto, sem adjetivo de sobra. Método antes de resultado. Nível técnico assumido. Nada de "apaixonado por tecnologia", "transformando ideias em realidade" ou métrica sem fonte.

### Idiomas
PT (padrão) e EN. A escolha fica em `localStorage` (`wsm.lang`) e vale para as duas páginas. `<html lang>` acompanha. Termos técnicos não são traduzidos.

### Tema
Claro e escuro, com escolha persistida (`wsm.theme`). O site abre no **claro**; se o visitante já escolheu, respeita a escolha. Sem flash: o tema é aplicado no `<head>` antes da pintura.

---

## 2. Conceito visual

**Manual técnico de operações.**

Referências de princípio (não de cópia): manuais de equipamento, fichas técnicas, cadernos de campo, documentação de engenharia, tipografia suíça aplicada a dados.

O que isso significa na prática:
- a **tipografia** carrega a hierarquia (não caixas, não sombras);
- **réguas** de 1px separam blocos;
- **números de índice** ancoram a leitura;
- **um acento** (ferrugem) marca o que está ativo ou o que é sinal;
- **assimetria controlada**: coluna de índice à esquerda, conteúdo à direita;
- **capturas reais** do fluxo entram como evidência, com legenda.

### Princípios
1. **Estrutura antes de ornamento.** Se um elemento não ajuda a ler, sai.
2. **Uma decisão por seção.** Cada seção responde a uma pergunta.
3. **Evidência acima de adjetivo.** Nome de ferramenta, etapa, captura, limite.
4. **Honestidade.** Nada de métrica inventada, cliente fictício apresentado como real ou nível de habilidade numérico.
5. **Movimento com motivo.** Entrada, foco, estado. Nunca loop decorativo.
6. **Contraste é requisito.** AA no corpo; AAA onde dá.

### Anti-referências (o que este site não é)
Template SaaS, dashboard, "site shadcn", cartões arredondados com sombra, gradiente em texto, glassmorphism, neon, hero centralizado com "Olá, sou X", três cards iguais, marquee infinito, cursor customizado, emoji na interface.

---

## 3. Identidade

- **Marca:** monograma `WM` em caixa alta dentro de um quadrado de 26px, traço 1px, sem raio.
- **Assinatura:** nome em Archivo 600, duas linhas, segunda linha em `--ink-3`.
- **Índice:** `01`–`06` em IBM Plex Mono, sempre alinhados à esquerda do bloco.
- **Acento:** ferrugem. Aparece em: marcador de status, item ativo, sublinhado de link, foco, número da etapa aberta. Nunca em bloco grande de fundo.

---

## 4. Tokens

### 4.1 Cor — claro (padrão)
| Token | Valor | Uso |
|---|---|---|
| `--paper` | `#E9E8E3` | fundo da página |
| `--paper-2` | `#E0DFD9` | faixa/realce sutil |
| `--paper-3` | `#D4D3CC` | trilha, desabilitado |
| `--ink` | `#131411` | texto principal |
| `--ink-2` | `#43443D` | corpo secundário |
| `--ink-3` | `#5F6058` | rótulos (AA sobre paper) |
| `--line` | `rgba(19,20,17,.16)` | régua padrão |
| `--line-2` | `rgba(19,20,17,.34)` | régua forte / hover |
| `--accent` | `#A83A1C` | sinal, ativo, foco |
| `--inv-bg` | `#131411` | botão sólido / faixa invertida |
| `--inv-ink` | `#EFEEE8` | texto sobre invertido |

### 4.2 Cor — escuro (`[data-theme="dark"]`)
| Token | Valor |
|---|---|
| `--paper` | `#101110` |
| `--paper-2` | `#171816` |
| `--paper-3` | `#20211E` |
| `--ink` | `#ECEBE4` |
| `--ink-2` | `#B4B5AC` |
| `--ink-3` | `#8B8C83` |
| `--line` | `rgba(236,235,228,.16)` |
| `--line-2` | `rgba(236,235,228,.36)` |
| `--accent` | `#E27A57` |
| `--inv-bg` | `#ECEBE4` |
| `--inv-ink` | `#101110` |

Regras: um acento por página, o mesmo em todos os componentes. Nunca preto puro nem branco puro. Nenhuma cor decorativa além do acento.

### 4.3 Tipografia
- **Display/corpo:** `Archivo` (400, 500, 600, 700) — grotesca, técnica, com personalidade.
- **Dados/rótulos:** `IBM Plex Mono` (400, 500).
- Fallback: `ui-sans-serif, system-ui, "Segoe UI", Arial`.

| Token | Tamanho | Uso |
|---|---|---|
| `--t-display` | `clamp(2.9rem, 8vw, 6.4rem)` | nome na home / título do caso |
| `--t-h2` | `clamp(1.9rem, 3.6vw, 2.9rem)` | título de seção |
| `--t-h3` | `clamp(1.15rem, 1.6vw, 1.4rem)` | subtítulo / projeto |
| `--t-lede` | `clamp(1.02rem, 1.2vw, 1.15rem)` | parágrafo de abertura |
| `--t-body` | `1rem` | corpo |
| `--t-small` | `.875rem` | apoio |
| `--t-label` | `.75rem` | mono, caixa alta, `letter-spacing .12em` |
| `--t-micro` | `.75rem` | metadados mono |

- Display: `line-height .94`, `letter-spacing -.035em`, peso 600.
- Corpo: `line-height 1.65`, `max-width 66ch`.
- Rótulos mono: caixa alta, nunca abaixo de 12px.
- Números: `font-variant-numeric: tabular-nums`.

### 4.4 Espaço
Escala de 4px: `4 · 8 · 12 · 16 · 24 · 32 · 48 · 64 · 96 · 128`.
- Seção: `clamp(72px, 10vw, 136px)` no topo/base.
- Bloco interno: 32–48px.
- Linha de lista: 14–20px vertical.

### 4.5 Grid e largura
- `--max: 1240px`; padding lateral `clamp(20px, 4vw, 40px)`.
- Desktop: `148px 1fr` (índice + conteúdo), gap 48px.
- Texto largo: `66ch`; texto curto: `52ch`.
- 12 colunas disponíveis para composições (fatos, capturas).

### 4.6 Breakpoints
`1080px` (rail recolhe) · `860px` (menu, colunas empilham) · `640px` (ações full-width, tipografia reduz).

### 4.7 Forma
- **Raio: 0 em tudo.**
- **Sombra: nenhuma.**
- **Borda: só régua de 1px** (`--line`), nunca caixa fechada.
- Botão sólido: bloco invertido, sem raio, altura 48px.
- Etiqueta: texto mono com colchete de índice, sem pílula.

### 4.8 Ícones
- Traço 1.5, 16px, `currentColor`.
- Apenas: sol, lua, seta (`→`, `↓`), fechar (`+` rotacionado).
- Sem biblioteca de ícones: o repertório é pequeno e geométrico de propósito.

### 4.9 Z-index
`10` topbar · `40` menu mobile · `60` toast · `80` dialog · `90` skip link.

---

## 5. Componentes

### 5.1 Topbar
Fixa, 64px, fundo `--paper`, régua inferior aparece após 8px de rolagem. Marca à esquerda, navegação central, controles à direita (idioma, tema, menu no mobile). Uma linha só no desktop.

### 5.2 Botão
- `.btn--solid`: fundo `--inv-bg`, texto `--inv-ink`, padding `0 24px`, altura 48px. Hover: `--accent` de fundo. Active: `translateY(1px)`.
- `.btn--line`: fundo transparente, régua inferior, texto `--ink`. Hover: `--accent`.
- `.link-arrow`: texto + seta; a seta anda 3px no hover; sublinhado cresce da esquerda.
- Foco: contorno 2px `--accent`, offset 3px. Nunca `outline: none` sem substituto.

### 5.3 Etiqueta
`[ n8n ]` em mono 12px, `--ink-3`. Sem fundo, sem borda, sem pílula. A lista inteira separa por `·`.

### 5.4 Índice de seção (rail)
Número `01` em mono 12px `--accent` + nome em 12px `--ink-3`. Sticky no desktop. No mobile, vira uma linha acima do título.

### 5.5 Lista de dados (`.rows`)
Régua entre linhas, sem caixa. Colunas: nome (1.2fr), categoria (1fr), estado (auto). No mobile, cada linha vira bloco com rótulos.

### 5.6 Acordeão (`.acc`)
Cabeçalho é `button` de largura total com número, título e sinal `+`. Aberto: sinal vira `×`, detalhe expande com `grid-template-rows`. `aria-expanded`, `aria-controls`, região com `role="region"` e `aria-labelledby`.

### 5.7 Etapas (`.steps`)
Lista vertical. Cada etapa é um botão; a ativa mostra o detalhe logo abaixo. Uma só aberta por vez. Teclado: Tab + Enter/Espaço. `aria-expanded`. No desktop, o detalhe também aparece ao lado? Não: a lista já é a leitura principal.

### 5.8 Captura (`.shot`)
Figura com régua superior, número, imagem e legenda. Clique abre `<dialog>` com a imagem ampliada (Esc fecha, foco volta). `loading="lazy"` fora do carrossel, `width`/`height` declarados.

### 5.9 Carrossel de capturas (`.crs`)
Uma captura por vez, dentro da captura 00 (visão geral). Estrutura: `viewport` (overflow oculto, régua, altura animada pelo JS para a altura do slide ativo) → `track` (grid de colunas 100%, transform) → slides `.shot`. Barra inferior: setas do sistema `←` `→` em mono à esquerda, contador `01 / 03` (`aria-live`) à direita. Estados: slides inativos com `aria-hidden` + `inert`. Interação: clique, teclas `←`/`→` no viewport (tabbable), arraste de 40px+. Reduced motion: transições zeradas globalmente. Sem JS: slides empilhados, barra oculta.

### 5.10 Formulário
`label` visível acima, `gap 8px`, input com régua inferior (sem caixa), foco em `--accent`, erro inline em `--accent` com `aria-describedby`. Envio abre o cliente de e-mail com nome e mensagem preenchidos. Toast confirma.

### 5.11 Toast
Faixa invertida no canto inferior, `aria-live="polite"`, 4s, sem ícone animado.

### 5.12 Controles segmentados
Idioma: dois botões `PT` / `EN` em mono, ativo em `--ink` + ponto de 3px embaixo. Tema: botão único com sol/lua e `aria-pressed`.

---

## 6. Composição

### Home
1. **Abertura** — nome, função, uma frase, duas ações, ficha (foco/base/estudo) e relógio local. Régua com "Portfólio · 2026".
2. **Projetos** — dossiê do projeto em uso: título, resumo, ficha curta, captura grande, etiquetas, link para o estudo de caso. Nota sobre próximos projetos.
3. **Sobre** — três parágrafos + lista de trajetória (sem datas inventadas).
4. **Habilidades** — três grupos honestos (uso diário, praticando, estudando) em lista com régua.
5. **Contato** — formulário + canais diretos (e-mail, GitHub, LinkedIn), e-mail visível por extenso.
6. **Rodapé** — ©, status, voltar ao topo.

### Estudo de caso
1. **Abertura** — voltar, título, uma frase, etiquetas.
2. **Ficha** — faixa com ambiente, gatilho, fonte, janela, saída.
3. **01 Em resumo** — quatro fatos (objetivo, problema, solução, resultado).
4. **02 O fluxo na prática** — captura 00 (visão geral, largura total) + carrossel das capturas 01–03 com setas, contador e aviso de higienização.
5. **03 Como funciona** — sete etapas em acordeão.
6. **04 Demonstração** — mensagem fictícia em formato de registro + o que ela faz.
7. **05 Desafios técnicos** — cinco acordeões.
8. **06 Tecnologias + aprendizados** — lista de ferramentas e cinco aprendizados.
9. **CTA** — contato / ver projetos.

---

## 7. Movimento

- Durações: `160ms` (hover), `320ms` (estado), `600ms` (entrada).
- Curva: `cubic-bezier(.22,1,.36,1)`.
- Só `transform` e `opacity`; altura animada apenas em acordeão (`grid-template-rows`).
- Entrada: linhas sobem 10px e aparecem, uma vez, via `IntersectionObserver`.
- Nada de loop, parallax, marquee ou digitação.
- `prefers-reduced-motion: reduce`: tudo estático, conteúdo visível.

---

## 8. Responsivo

- **≥1080:** rail + conteúdo; hero em 2 colunas; ficha do caso ao lado do resumo.
- **860–1079:** rail vira linha; hero empilha; fatos em 2 colunas.
- **<860:** menu mobile; listas viram blocos; capturas em 1 coluna.
- **<640:** display menor; botões full-width; espaçamento de seção 64px.

Nenhuma seção depende de hover para ser entendida.

---

## 9. Acessibilidade

- Skip link, `header/nav/main/footer`, um `h1` por página.
- Foco visível sempre (2px `--accent`).
- Contraste: corpo AA; rótulos ≥ 4.5:1.
- Controles com nome acessível; `aria-expanded`, `aria-controls`, `aria-pressed`, `aria-current`.
- Formulário: `label` visível, `autocomplete`, erro com texto e `aria-invalid`.
- Dialog nativo com `showModal`, foco contido, Esc.
- Conteúdo essencial legível sem JS (as classes `.rv` só escondem quando o JS está ativo).
- Imagens com `alt` descritivo; decorativas com `alt=""`.

---

## 10. O que não fazer

- Não reintroduzir React, Babel, Tailwind ou qualquer build.
- Não usar cartão com sombra, raio > 0 ou fundo elevado.
- Não usar gradiente, glass, neon, textura de ruído.
- Não usar mais de um acento.
- Não usar ícone de biblioteca genérica nem emoji.
- Não criar número, empresa, cliente ou resultado que não exista.
- Não animar nada em loop nem no scroll contínuo.
- Não duplicar CSS entre páginas: tokens e componentes são compartilhados.
- Não esconder conteúdo atrás de JS.
- Não usar placeholder como rótulo.

---

## 11. Exemplos de uso

```html
<!-- ação primária -->
<a class="btn btn--solid" href="#contato">Falar comigo <span aria-hidden="true">→</span></a>

<!-- dado de ficha -->
<div class="meta__item">
  <dt>Ambiente</dt>
  <dd>n8n</dd>
</div>

<!-- etapa -->
<button class="step" aria-expanded="true" aria-controls="step-1">
  <span class="step__n">01</span>
  <span class="step__t">Agendamento</span>
  <span class="step__x" aria-hidden="true">+</span>
</button>

<!-- captura -->
<figure class="shot">
  <img src="assets/fluxo-n8n.png" alt="Fluxo no n8n com quatro etapas" width="1600" height="900" loading="lazy">
  <figcaption><span>01</span> O fluxo inteiro em quatro etapas.</figcaption>
</figure>
```

---

## 12. Decisões registradas

- **Claro por padrão:** o site anterior abria no escuro. A inversão marca a nova identidade e melhora a leitura das capturas do n8n (fundo claro).
- **Sem cards:** toda separação usa régua e espaço, o que reduz ruído e mantém a página leve.
- **Etapas em acordeão vertical:** no mobile o padrão anterior (rail horizontal de sete itens) ficava apertado; a lista vertical funciona igual nos dois tamanhos.
- **Capturas ampliáveis em `<dialog>`:** evita dependência de lightbox e mantém teclado/Esc nativos.
- **Carrossel nas capturas 01–03 (pedido do autor, 2026-10-22):** substitui a grade de capturas; a captura 00 permanece em largura total como visão geral. Vanilla JS (~80 linhas), sem controle de biblioteca; `inert` nos slides inativos mantém o foco no slide corrente.
- **i18n por atributo (`data-i18n`):** mantém o HTML legível e o dicionário em um arquivo só.
- **Fontes via Google Fonts:** sem build para self-host; fallback de sistema garante leitura se o CDN falhar.
- **`PLAN.md`:** documenta o processo desta reconstrução; não é fonte de verdade do produto.
