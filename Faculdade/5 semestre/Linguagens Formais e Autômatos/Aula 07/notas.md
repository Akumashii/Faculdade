# Gramática Regular

## Linguagens Regulares

(algumas linguagens não conseguimos escrever pois transcendem a linguagem regular)

- Formalismo reconhecedor ou operacional AFD, AFN e AFE
- Formalismo denotacional: Expressão Regular (ER)
- Formalismo gerador ou axiomático: Gramática Regular (GR)

## Gramática

Definição 1: Gramática

Uma gramática é uma quádrupla ordenada G = (V, T, P, S) em que:
- V é o conjunto de símbolos varíaveis ou não terminais
- T é o conjunto de símbolos terminais disjuntos de V (alfabeto $\Sigma$) 
- P é o conjunto de regras de produção. Conjunto finito de pares, denominados regras de produção tal que a primeira componente é palavra de (V $\cup$ T) $^+$ e a segunda é palavra de (V $\cup$ T) *
- S é elemento de V denominado variável inicial

Regra de Produção: 

- a -> b (lê-mos 'a' produz 'b')
- A -> aaA (lê-mos 'A' produz a sequência 'aaA')

### exercicios
#### ✶ exemplo1: ab
- $G1(V, T, P, S)$ em que:
- $V = \\{A\\}$
- $T = \\{a, b\\}$
- $P = \\{A -> ab\\}$
- $S = A$

ou

- $G1= (\\{A\\}, \\{a, b\\}, P, A)$ em que $P = \\{A → ab\\}$

#### ✶ exemplo2: (a+b)
- $G2(V, T, P, S)$ em que:
- $V = \\{A\\}$
- $T = \\{a, b\\}$
- $P = \\{A -> a | b\\}$ (lê-mos, 'A' produz 'a' ou 'b')
- $S = A$

ou

- $G2= (\\{A\\}, \\{a, b\\}, P, A)$ em que$ P = \\{A → a | b\\}$

em outra forma, $P = \\{A → a, A → b\\}$

#### ✶ exemplo3: (aa+bb)
- $G3(V, T, P, S)$ em que:
- $V = \\{X\\}$
- $T = \\{a, b\\}$
- $P = \\{A → aa | bb\\}$ (lê-mos, 'A' produz 'aa' ou 'bb'}
- S = A

ou

- $G3= (\\{X\\}, \\{a, b\\}, P, X) em que P = \\{A → a | b\\}$
	- Derivação de Palavras: bb
	- X → bb

#### ✶ exemplo4: Que linguagem é produzida por esta gramática?

- $G4 = (V, T, P, S)$ em que:
- $V = \\{A, B\\}$
- $T = \\{a, b\\}$
- $P = \\{A → ab | B, B → aB | \varepsilon \\}$
- $S = A$

Derivações
- $A → ab$
- $A → B → \varepsilon$
- $A → B → aB → a\varepsilon$

#### ✶ exemplo5: (a+b)*
- $P = \\{ X → \varepsilon | a | b | aX | bX \\}$ (recursão)

#### ✶ exemplo6: aa(a+b)*
- $P = \\{X → aaY, Y → \varepsilon | aY | bY\\}$
- $G = (\\{X,Y\\}, \\{a, b\\}, P, X)$

Derivação: aab
- $X → aaY → aabY → aab\varepsilon$

#### ✶ exemplo6: (a+b)*aba
- $P = \\{A → aA | bA | \varepsilon B, B → aba\\}$
- $P = \\{A → aA | bA | aba\\}$
- $P = \\{A → Baba, \ B → aB | bB\ \varepsilon \\}$
