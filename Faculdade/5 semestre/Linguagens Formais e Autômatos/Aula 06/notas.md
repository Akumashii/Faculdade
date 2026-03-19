# Autômato Finito
- Determinístico (AFD)
- Não-determinístico (AFND)
- com Movimentos Vazios (AFE)

# Autômato Finito com Movimentos Vazios

Movimentos vazios constituem uma generalização dos modelos de máquima não determinística, um movimento vazio é uma transição sem leitura de símbolo algum da fita. Qualquer Autômato Finito com Movimentos Vazios pode ser simulado por um AFN

Esse movimento não aumenta o poder computacional do autômato

É representada pela aplicação da função programa, em um estado q ao símbolo $\varepsilon$

exemplo: L2 = { $a^nb^k$ | n >= 0 e k >= 0 }

| $\sigma$ | a    | b     | $\epsilon$ |
| :---:  | :---:  | :---: | :---: |
| q0     | {q0}   | -     | {q1}  |
| q1     | -      | {q1}  |       |

O processamento de um AFE é análogo a um AFN, adicionalmente, o processo de entrada vazia não é determinístico, ou seja, um AF pode processar a entrada assume simultaneamente os estados destino e origem (esse último é sempe um caminho alternativo)

### Definição AFNE

Um Autômato Finito com Movimentos Vazios (AFNE ou AFE) é uma 5-ulpa:

### Atividade

fica para fazer os exercícios 6, 7, 9, 11 e 12 da Lista 2.

---

# Linguagens Regulares: Expressão Regular (ER)

Expressão Regular (ER) -> denotacional, representa uma linguagem regular

Uma expressão regular é um **formalismo denotacional** para as linguagens regulares, também é considerado um **formalismo gerador**, pois por meio de uma **Expressão Regular** é possível gera as palavras de uma **Linguagem Regular**

Uma Expressão Regular é definida a partir de conjuntos básicos e operações de concatenação e união

Uma linguagem gerada por uma expressão regular é representada por L(r) ou GERA(r)

### Definição 

Uma Expressão Regular (ER) sobre um alfabeto $\Sigma$ definida:
- $\varnothing$ é uma ER e denota a Linguagem Vazia, L = {}
- $\varepsilon$ é uma ER e denota a Linguagem que possui somente a Palavra Vazia, L = { $\varepsilon$ }

Qualquer símbolo x $\in$ $\Sigma$ é uma ER e denota a Linguagem contendo {x}
- exemplo: a denota L = {a}

Se 'r' e 's' são ER e denotam as linguagens 'R' e 'S', respectivamente, então:
- (r + s) é ER e denota a linguagem R $\union$ S
  -  exemplo: (a + b) denota L = {a + b}
- (rs) é ER e denota a linguagem RS = { uv | u $\in$ R e v $\in$ S}
	- exemplo: (ab) denota L = {ab}
- (r*) é ER e denota a linguagem R*
	- exemplo: (a*) denota L = { $a^n$ | n >= 0}

 ### Exemplos

 Seja $\Sigma$ = {a, b}

| Expressão Regular  | Linguagem  |
|:---|:---|
| aa  | L1 = {aa}  |
| ba*  | L2 = {todas as palavras que iniciam por b e possuem 0 ou mais a's na sequência  |
| (a+b)*  | L3 = {todas as palavras sobre {a, b} }  |
| (a+b)∗aa(a+b)∗  | L4 = {w possui aa como subpalavra} |
| a∗ba∗ba∗ | L5 = {possui apenas b's} |
| (a+b)∗(aa+bb)  | L6 = {w | w possui aa ou bb como sufixo}  |

### Classes de Linguagens Regulares

A classe das expressões regulares denota exatamente a classe das linguagens regulares, ou seja:
-
