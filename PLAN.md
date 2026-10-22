# PLAN.md — Reconstrução do portfólio (2026)

## 1. Diagnóstico do que existia

- Duas páginas (`index.html`, `certificados.html`), cada uma com CSS inline e React 18 + Babel via CDN.
- Design escuro fixo, monocromático, malha de pontos, seções numeradas, cartões sem borda.
- Conteúdo real: helpdesk/sistemas, automação com n8n, estudo de programação, um estudo de caso (certificados digitais) com capturas higienizadas.
- Problemas: dependência de CDN para renderizar (React/Babel), CSS duplicado entre páginas, HTML monolítico, contraste baixo em vários rótulos, animação de digitação que some se o JS falhar, e identidade presa ao visual "portfólio dark com grade".

## 2. Direção visual

**Conceito:** um **manual técnico de operações** — o portfólio como um caderno de campo de quem mantém sistemas e automatiza processos.

- Claro por padrão (papel frio), com versão escura equivalente.
- Tipografia como estrutura: Archivo (display/corpo) + IBM Plex Mono (rótulos, dados, índices).
- Zero cartões, zero sombras, zero raios. Separação por régua, espaço e hierarquia.
- Um único acento: ferrugem (`--accent`), usado como sinal (marcador, estado ativo, link), nunca como decoração.
- Coluna de índice fixa à esquerda no desktop; conteúdo assimétrico à direita.
- Movimento só onde explica: entrada de linha, sublinhado, abertura de etapa. Nada em loop.

## 3. Arquitetura

```
index.html            home
certificados.html     estudo de caso
assets/               capturas higienizadas (reaproveitadas)
css/tokens.css        variáveis (cor, tipo, espaço, movimento)
css/base.css          reset, tipografia, utilitários, acessibilidade
css/layout.css        topbar, wrap, rail, seções, rodapé
css/components.css    botões, tags, listas, acordeão, form, dialog, toast
css/home.css          composições da home
css/case.css          composições do estudo de caso
js/copy.js            dicionário PT/EN
js/ui.js              tema, idioma, menu, relógio, reveal, toast, dialog
js/home.js            formulário de contato
js/case.js            etapas e desafios
PRODUCT.md            fonte de verdade (produto + design system)
```

Sem build, sem npm, sem framework. Scripts `defer`, na ordem `copy → ui → página`.

## 4. Componentes (shadcn/React Bits → HTML/CSS/JS)

| Referência | Equivalente implementado |
|---|---|
| Button (variantes) | `.btn` sólido/invertido + `.link-arrow` textual |
| Tabs | Lista de etapas com `button` + `aria-expanded` e detalhe inline |
| Accordion | `.acc` com `aria-expanded`, `aria-controls` e animação de altura |
| Tooltip | `title` nativo + rótulo visível (sem dependência) |
| Toast | `.toast` com `aria-live="polite"`, um por vez |
| Dialog | `<dialog>` nativo para ampliar capturas, com Esc e foco |
| Segmented control | `.seg` para idioma (dois botões com `aria-pressed`) |
| Switch | Botão de tema com `aria-pressed` e ícone sol/lua |
| Table | Listas `.rows` com régua e colunas fixas |
| Reveal / AnimatedContent | `IntersectionObserver` + classe `.in` |
| CountUp | não usado (nada de número inventado) |
| Marquee / Carousel infinito | descartados (movimento sem função) |

## 5. Dependências

- **Fontes:** Archivo + IBM Plex Mono (Google Fonts, com fallback de sistema). Sem JS de terceiros.
- **Ícones:** poucos SVGs inline (sol, lua, seta, fechar), traço 1.5.
- **Imagens:** as quatro capturas já higienizadas em `assets/`.
- Nenhuma biblioteca de animação: CSS + IntersectionObserver bastam.

## 6. Conteúdo

Preservado integralmente (sem inventar empresa, cliente, número ou resultado). O estudo de caso continua anônimo e com dados fictícios. O texto em inglês existente é mantido no dicionário.

## 7. Responsivo

- ≥1080px: rail de índice visível, hero em duas colunas, estudo de caso com ficha ao lado.
- 860–1079px: rail recolhe, hero empilha, colunas de fatos em 2.
- <860px: navegação vira menu, tabelas viram blocos rotulados, capturas em coluna única.
- <640px: tipografia e espaçamentos reduzidos, ações em largura total.

## 8. Acessibilidade

Skip link, landmarks, um `h1` por página, ordem de títulos, foco visível, contraste AA, `aria-expanded`/`aria-controls`, `aria-pressed`, formulário com `label` visível e erro inline, `prefers-reduced-motion`, `lang` sincronizado com o idioma.

## 9. Critérios de aceite

- Nenhum erro de console; páginas funcionam com JS desativado no essencial (conteúdo visível).
- Nenhum cartão com sombra/raio; nenhuma animação infinita.
- Home e estudo de caso consistentes nos dois temas e nos três breakpoints.
- Detector do impeccable sem apontamentos introduzidos por esta versão.
- Publicação via Git na `main` ao final.
