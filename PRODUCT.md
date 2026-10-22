# PRODUCT.md — Portfólio Wesley Melo

## O que é
Site pessoal de uma página que apresenta a trajetória de Wesley Melo na área de helpdesk, sistemas e automação, com um estudo de caso técnico em página separada (`certificados.html`).

## Para quem
- **Empregadores de suporte/infra**: querem saber o que ele já faz e se resolve problema de verdade.
- **Pessoas que precisam automatizar um processo**: procuram alguém que entenda dados, regras e integração.
- **Leitores de portfolio técnico**: avaliam qualidade de raciocínio, não só resultado final.

## Superfícies
| Página | Papel |
|---|---|
| `index.html` | Home: hero, projetos em destaque, sobre, habilidades, contato |
| `certificados.html` | Estudo de caso do fluxo n8n: resumo, capturas, etapas, demonstração, desafios, tecnologias |

## Voz
Português do Brasil, direto e sem adjetivos de sobra. Fala de método antes de falar de resultado. Assume leitor técnico: pode usar nome de ferramenta (n8n, API do CRM) sem explicar o básico.

## Idiomas
Site bilíngue: português (padrão) e inglês. A escolha do visitante fica salva no navegador e vale para as duas páginas. Termos técnicos não são traduzidos.

## Tema
O site abre sempre no modo escuro, nas duas páginas. O visitante pode alternar para claro durante a visita, mas a próxima entrada começa de novo no escuro.

## Regras de conteúdo
- Nada de dado real: empresas, sistemas, clientes e credenciais aparecem sempre como fictícios.
- **Capturas de tela só entram no site depois de higienizadas** (endpoints, chaves, tokens, e-mails, ids e telefones removidos) e com legenda curta explicando a etapa.
- O visitante tem que entender a proposta em poucos segundos: por isso a home é curta e os projetos vêm logo depois da hero.
- Cada projeto segue a mesma ordem: objetivo, problema, solução, tecnologias e resultado. Resultado sem evidência é declarado como expectativa, nunca como número inventado.
- Nível de habilidade é autoavaliação honesta, com rótulo (`Base sólida`, `Praticando`, `Estudando`, `Uso diário`) e não número inventado.
- E-mail, GitHub e LinkedIn com link real. Se algum perfil ainda não existir, marcar como "Perfil em breve" com `aria-disabled`, sem link quebrado.
- Sem promessa de resultado e sem métrica sem fonte.

## Restrições técnicas
- Site estático: sem Node, sem build, sem npm. Um `index.html` por página, CSS inline, React 18 + Babel via CDN onde há interatividade.
- Sem cor decorativa: preto, branco e um verde de status usado só como sinal.
- Sem dados reais, sem rastreamento, sem cookies além do tema salvo em `localStorage`.
