# Linguagens Livres do Contexto (LLC) -=- Autômato c/ Pilha (formalismo reconhecedor ou operacional)
# Gramática Livre do Contexto (formalismo gerador ou axiomática)

Para a gramática regular p/ gramática livre de contexto vai mudar as regras de produção.

relembrando GRAMÁTICA 4-upla:
- $G = (V, T, P, S)$
	- $V$ -> Variáveis (letra maiúscula)
	- $T$ -> Terminais, aqueles usados na formação das palavras (letra minúscula)
	- $P$ -> Conjunto de Regras de Produção, vai definir como as palavras da gramática será gerada
	- $S$ -> Variável Inicial

as Regras de Produção(P) são da forma:  
-  	A → w	ou A → wB 
	
em que: 
- A $\in$ $V$;
- B $\in$ $V$; e
- w $\in$ $T$*

---
Gramática Livre do Contexto
---

Continua sendo uma 4-upla. As Regras de Produção(P) são da forma:
- $\alpha → \beta$

em que:
- $\alpha \in V$; e
- $\beta \in (V\cup T)^\*$

---
Exemplo
---

Seja $L_1 = \\{a^nb^n\\} \mid n>=1\\}$

$G_1 = (\\{A\\}, \\{a, b\\}, P, A)$  
em que $P = \\{X → aXb \mid ab\\}$

árvore derivação:

``` mermaid
graph LR
	%%ID[Texto] : Retângulo (comum para variáveis).%%
	%%ID((Texto)) : Círculo (comum para estados).%%
	%%ID(Texto) : Retângulo arredondado (comum para terminais).%%
	ID[ÁRVORE DERIVAÇÃO]

    X1[X] --> a1(a)
    X1 --> X2[X]
    X1 --> b1(b)
    
    X2 --> a2(a)
    X2 --> X3[X]
    X2 --> b2(b)
    
    X3 --> a3(a)
    X3 --> X4[X]
    X3 --> b3(b)
    
    X4 --> a4(a)
    X4 --> X5[X]
    X4 --> b4(b)
    
    X5 --> a5(a)
    X5 --> b5(b)

	%%style [ID do Nó] [propriedade]:[valor], [propriedade]:[valor]%%
```
