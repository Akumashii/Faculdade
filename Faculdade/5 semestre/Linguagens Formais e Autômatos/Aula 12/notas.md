# Lingugens Regulares

> "Uma das principais características das
> Linguagens Regulares é o fato de serem
> representadas por formalismos de pouca
> complexidade, grande eficiência e fácil
> implementação. Entretanto, por ser uma classe
> relativamente simples, é restrita e limitada"

Como determinar se uma Linguagem não é Regular?
---

**Lema do Bombeamento para Linguagens Regulares**
- Para provar que uma linguagem não é regular usamos o Lema do Bombeamento

- Se uma linguagem é regular, então é aceita por um AFD, o qual possui um número finito de estados;
- Se o AFD reconhece uma entrada w com tamanho maior que o número de estado que ele possui, em algum momento, há um ciclo na função programa do AFD;
- Assim, w pode ser dividida em 3 subpalavras w=uvz tal que |uv| ≤ n (número de estados do AFD), |v|≥1 e v é a parte de w reconhecida pelo ciclo. Portanto, para qualquer i≥0, uvi z é palavra da linguagem (é aceita pelo AFD).

Supondo que 'n' que é a quantidade de estados em um AFD e 'w' a palavra de entrada: 
- |w| >= n, w = uvz
	- |uv| <= n
 	- |v| >= 1
  	- para todo $i >= 0, uv^iz$ é a palvara L
 
---
Exemplo 1
---

$L = \\{a^kb^k\\} \mid K>=1\\}$

n = 3  
w = aabb
- uv = **(aab)** b
- v = aa **(b)** b
- z = aab **(b)**

para todo i>=0
| i | $uv^iz$ |
| :------- | :----: |
| 0        | $aab^0b = aa\varepsilon b = aab \in L?$ (ERRO) Não, então L não é Linguagem Regular |
| 1        |  $aab^1b = aabb$ |
| 2        |  $aab^2b = aabbb$ |

---
Exemplo 2
---

$L_1 = \\{a^nb^nc^n\\} \mid n>=1\\}$

n = 5  
w = aabbcc
- uv = **(aabbc)** c
- v = aabb **(c)** c
- z = aabbc **(c)**

para todo i>=0
| i | $uv^iz$ |
| :------- | :----: |
| 0        | $aabbc^0c = aabb\varepsilon c = aabbc \in L_1?$ (ERRO) Não, então $L_1$ não é Ling. Regular |
| 1        | $aabbc^1c = aabbcc$ (OK) |
| 2        | $aabbc^2c = aabbccc$ (ERRO) |

---
Exemplo 3
---

$L_2 = \\{a^nb^{2n}\\} \mid n>=0\\}$

n = 3  
w = aabbbb
- uv = **(aab)** bbb
- v = aa **(bb)** bb
- z = aab **(bbb)**

para todo i>=0
| i | $uv^iz$ |
| :------- | :----: |
| 0        | $aa(bb)^0bb = aa\varepsilon bb = aabb \in L_2?$ (ERRO) Não, então $L_2$ não é Ling. Regular |
| 1        | $aa(bb)^1bb = aabbbb$ (OK) |
| 2        | $aa(bb)^2bb = aabbbbbb$ (ERRO) |

## Lingugem Regular Vazia, Finita, Infinita
Se L é uma Linguagem Regular aceita por um $AF M = (\Sigma, Q, \sigma, q0, F)$ com n estados, então L é:
a) Vazia se, e somente se, M não aceita qualquer palavra w tal que |w| < n
b) Finita se, e somente se, M não aceita uma palavra w tal que n ≤ |w| < 2n
c) Infinita se, e somente se, M aceita uma palavra w tal que n ≤ |w| < 2n

## Igualdade de Linguagens Regulares

Duas Linguagens Regulares são iguais se os formalismos que as reconhecem são equivalentes.






