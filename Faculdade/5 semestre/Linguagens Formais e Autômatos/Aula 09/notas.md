# Derivação

Começamos pela variável inicial X, enquanto tivermos variáveis a palavra continua.
### Exemplo
$(a + b)^\ast aba$
- $P = \\{X → aX | bX | \varepsilon Y, Y → aba\\}$
- $G = (\\{X, Y\\}, \\{a,b\\}, P, X)$

Derivação de abbaaba:
- X -> aX -> abX-> abbX -> abbaY -> abbaaba

# Gramática Linear

Toda Gramática Regular é uma Gramática Linear, a classe das Gramáticas Regulare é qualquer Gramática Linear

Nas Regras de Produção das Gramáticas Lineares, o lado direito é constituído por, no máximo, uma variável, há 4 gormalismos equivalentes, veja: 

Seja G=({A, B}, T, P, S) uma gramática e w uma palavra de T*. Então G é uma:
1) Gramática Linear à Direita (GLD), se todas as regras de produção são de forma:
	- A → wB ou A → w
2) Gramática Linear à Esquerda (GLE), se todas as regras de produção são da forma:
	- A → Bw ou A → w
3) Gramática Linear Unitária à Direita (GLUD), se é uma (GLD) e |w| <= 1
4) Gramática Linear Unitária à Esquerda (GLUE), se é uma (GLE) e |w| <= 1

