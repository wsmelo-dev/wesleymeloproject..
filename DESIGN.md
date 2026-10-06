# DESIGN.md — Wesley Santos de Melo (portfolio)

## Identidade
Preto profundo + vermelho contido. Sem neon exagerado, sem beige, sem cards aninhados, sem gradient text, sem glows coloridos.

## Tokens (de `wesleymeloPJ.com-main/index.html`, `:root`)
- `--bg` #060608 · `--bg-soft` #0B0B0E · `--surface` #101014 · `--surface-2` #17171C
- `--text` #F5F5F7 · `--text-2` rgba(245,245,247,.72) · `--text-3` rgba(245,245,247,.48)
- `--accent` #E0242E · `--accent-2` #F0434D · `--accent-deep` #8F0F18 · `--accent-soft` rgba(224,36,46,.12)
- Radius: `--r-card` 18px · `--r-inner` 12px · `--r-pill` 999px
- Fonte: system stack (`--font`) + mono para rótulos técnicos/código (`--mono`)
- Motion: `--ease` cubic-bezier(.16,1,.3,1); reveal por seção com variantes (default/blur/scale); cursor customizado desktop-only; progress bar no topo; parallax sutil na hero; respeito total a `prefers-reduced-motion`.

## Estrutura
Entrada (gate WM vermelho → wipe vermelho → reveal da hero) → Hero (WESLEY em vermelho, MELO vazado com sweep, status, meta, botões) → Sobre/Identidade (foto + texto editorial + 4 valores) → Stack (chips + Agora/A seguir/Sempre) → Projetos (cards grandes com preview reativo) → Trajetória (roadmap) → Contato (mega título VAMOS CONSTRUIR ALGO JUNTOS. + e-mail copiável) → Footer.

## Responsivo
Grid de hero colapsa para 1 coluna em ≤920px; navbar vira menu hambúrguer em ≤820px; cursor/parallax desligados em touch ou reduced-motion; chips/learn/stacks empilham em ≤760px.
