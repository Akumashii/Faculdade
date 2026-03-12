# Definição Função Programa Extendida, Computação

função programa extendida usada para mostrar formalmente a computação de um AF, antes veja a função programa:
-  $\sigma$(a,q), w ---> Função Programa

Seja um AFD M = ($\Sigma$, Q, $\sigma$, q0, F) a Função Programa Extendida é definida por:
- $\sigma$ : Q x $\Sigma$* -> Q 

e é indutivamente definida:
- $\underline\sigma$ (q, $\epsilon$) = q 
- $\underline\sigma$ (q, aw) = $\underline\sigma$ ( $\sigma$(a,q), w) ---> Função Programa Extendida

Portanto, a $\sigma$ consiste na sucessiva aplicação da $\sigma$ à palavra de entrada

Exemplo: $\sigma$ M1 e w = 101 
- $\underline\sigma$ (q0, 101) = $\underline\sigma$ ($\sigma$ (q0,1), 01)
- $\underline\sigma$ (q1, 01) = $\underline\sigma$ ($\sigma$ (q1,0), 1)
- $\underline\sigma$ (q0, 1) = $\underline\sigma$ ($\sigma$ (q0,1), $\epsilon$)
- $\underline\sigma$ (q1, $\epsilon$) = q1, como q1 é estado final, w foi ACEITA!

# Autômato Finito Não-Determinístico (AFND ou AFN)

É quando um autômato possui mais de um caminho para o mesmo simbolo no mesmo estado, assim não é possível determinar o fluxo entre estados.

A função programa de um Autômato Finito Não-Determinístico (AFN) ao processar uma entrada (estado corrente e símbolo lido) tem como resultado um conjunto de novos estados.

AFN assume um conjunto de estados alternativos, como se houvesse uma multiplicação de unidades de controle, uma para cada alternativa, processando independentemente, sem compartilhar recursos.
- O processamento de um caminho não influi no estado, símbolo lido e posição da cabeça da fita para os demais caminhos novos
- O processamento de um AFN M para um cpnjunto de estados, ao ler um símbolo, é a união dos resultados da função programa aplicada a cada estado alternativo

Embora a facilidade do não determinístico seja aparente, na relaidade não aumenta o poder computacional. Assim, qualquer AFN pode ser simulado por um AFD, o contrário também é verdadeiro.

## Definição

Um Autômato Finito Não-Determinístico é uma 5-supla:
- ($\Sigma$, Q, $\sigma$, q0, F)

Onde:
- $\Sigma$ é o alfabeto de entrada
- Q é o conjunto de estados possíveis do autômato. É um conjunto finito.
- $\epsilon$ é a função programa ou função de transição. $\sigma$ : Q x $\Sigma$* -> $2^Q$
- q0 é o estado inicial. q0 $\in$ Q
- F é o conjunto de estados finais e está contido em Q

Exemplo: L1 = {w $\in$ {a,b}* | w possui aa ou bb como subpalavra}

| $\sigma | a | b |
|---|---|---|
| q0 | {q0, q1} | {q0, q2} |
| q1 | {q3} | - |
| q2 | - | {q3} |
| q3 | {q3} | {q3} |

