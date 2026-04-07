# Gramática Regular

Gramática, G = (V, T, P, S)
- V -> Variáveis (letra maiúscula)
- T -> Terminais, aqueles usados na formação das palavras (letra minúscula)
- P -> Conjunto de Regras de Produção, vai definir como as palavras da gramática será gerada
- S -> Variável Inicial

$\alpha$ --(produz)--> $\beta$
- em que $\alpha$ $\in$ V
- $\beta$ $\in$ $(V \cup T)*$
- com wA ou Aw e w $\in$ T*
- $\beta$ -> conterá no máximo 1 variável

### Exemplo

Gx ({A,B}, {a,b} P, A):
- P = {A → aA | bB , B → bB | b}

Derivação:
- A → aA → aaA → aabB → aabbB → aabbb
- Qual a linguagem gerada?
	- Expressão Regular: $a^\ast bb^\ast b$
 	- ER denota a linguagem!!

### Exemplo5
$(a + b)^\ast aba$
- $P = \\{X → aX | bX | \varepsilon B, B → aba\\}$

ou
- $P = \\{X → aX | bX | aba\\}$
- $G = (\\{X\\}, \\{a,b\\}, P, X)$

### Exemplo6
$(aa + bb)^\ast (a + \varepsilon)$
- $P = \\{A → aaA | bbA | \varepsilon B, B → a | \varepsilon\\}$
- $G = (\\{A,B\\}, \\{a,b\\}, P, X)$

Derivação: bba
- A → bbA → bb\varepsilon B → bb\varepsilon a

### Lista Exercício 1: ' A' até 'D'



