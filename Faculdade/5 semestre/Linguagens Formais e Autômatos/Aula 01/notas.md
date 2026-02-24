# Linguagens Formais e Autômatos

### Teoria das Linguagens Formais

1936 - Allan Turing
Década de 50, desenvolvimento de teorias relacionadas com linguagens naturais: 
importância para o estudo das linguagens artificiais

Hierarquia de Classes de Linguagens -> Chomsky: Gramáticas Formais

Tipos de Linguagens:
- Linguagens Enumeráveis Recursivamente
  - └-> Linguagens Sensíveis ao Contexto
    - └-> Linguagens Livres do Contexto
      - └-> Linguagens Regulares

Principais aplicações:
- Análise léxica e sintática Tradutores de linguagens →
Tradutores de linguagens de programação de programação
  - Compilador, Interpretador, Montador (assembler)
- Protocolos de comunicação (modelos)
- Modelos de sistemas biológicos
- Procura em corpo de texto, ocorrências de palavras, frases…
- Desenho de hardware (circuitos digitais)


### Terminologia
- Léxico
  - Relativo à dicionário   
- Sintaxe
  - Gramática, a forma da linguagem
- Semântica
  - Significado, sentido 

### Formalismos usados
1) Formalis Operacional ou Reconhecedor
  - Autômato = Máquina Abstrata
2) Formalismo Axiomático ou Gerador
  - Gramática = Regras associadas ao comportamento da linguagem
3) Formalismo Denotacional
  - Expressão Regular

---

## Conceitos Iniciais

### Definições

1) Alfabeto ($\sum$)
  - Um alfabeto é um conjunto finito de símbolos (alguns exemplos são letras e dígitos)
2) Palavra, Cadeira de caracteres ou Sentença
  - É uma sequência finita de símblocos do alfabeto justaposto

  - $\varepsilon$ -> representa a palavra vazia (palavra sem símbolo)
  - $\sum$ -> representa um alfabeto
  - $\sum$* -> representa todas as palavras possíveis sobre um $\sum$
  - $\sum^+$ -> representa todas as palavras possíveis sobre $\sum$ excetuando-se $\varepsilon$,
  ou seja, $\sum^+$ = $\sum$ - { $\varepsilon$ }

3) Tamanho ou Comprimento
- O tamanho ou comprimento de uma palavra W é o número de símbolos que esta palavra contém e é representado por |W|

4) Prefixo, Sufixo, Subpalavra
- Prefixo de uma palavra é qualquer sequência inicial de símbolos da palavra
- Sufixo de uma palavra é qualquer sequência final de símbolos da palavra
- Subpalavra de uma palavra é qualquer sequência de símbolos contígua de palavra

ex:
$\omega$ = aeb 
prefixo: a, ae, aeb
sufixo: b, eb, aeb
subpalavras: prefixos, sufixos, e


5) Linguagem Formal
$\sum$ ={0,1}

L1 = {w $\in$ $\sum^+$ | |w| = 2}
ou
L1 = {00, 01, 10, 11}

L2 = {w $\in$ $\sum^+$ | w tem sufixo 1}
ou
L2 = {1, 01, 11, 001, 011, ...}


6) Concatenação
A concatenação é uma operação binária que associa a cada par de palavras uma terceira palavra formada pela justaposição da primeira com a segunda. Essa operação satisfaz às propriedades descritas a seguir, Considerando que v, w, t são palavras iguais.

7) Concatenação Sucessiva
A concatenação sucessiva de uma palavra (com ela mesma), $w^n$, é definida como segue:

a) w $\neq$ $\varepsilon$
- $w^0$ = $\varepsilon$
- $w^n$ = $w^{n-1}$ w, para n > 0
    
b) w = $\varepsilon$ 
- $w^0$ é indefinida
- w^n = $\varepsilon$, para n > 0
