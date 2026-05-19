# Forma Normal de Chomsky

Forma Normal estabelece restrições rígidas na forma das produções, então no formato, de uma Gramática Livre do Contexto, sem alterar a linguagem gerada e sem reduzir poder de geração da gramática.

Usadas no desenvolvimento de algoritmos (reconhecedores) e na porva de teoremas.

Formal de Chomsky
---

Uma Gramática Livre do Contexto $G = (V, T, P, S)$ estará na forma normal de Chomsky, se todas as suas produções são de forma:
- $A \space  → \space  BC$ ou $A \space → \space  a$

# Transformação para a Forma Normal de Chomsky

1° Simplificação da Gramática
---
1) excluir produções vazias
2) excluir produções de forma $A \space  → \space  B$
3) excluir símbolos inúteis

2° Tranformação do lado direito da produções de comprimento maior ou igual a dois
---
- Se as produções têm comprimento maior ou igual a dois, devem ser formadas somente por variáveis
- A exclusão de um terminal 'a' pode ser realizada, substituindo-se este por uma variável intermediária $C_a$ e incluindo a produção $C_a \space → \space a$

3° Transformação do lado direitp das produções de comprimento maior ou tigual a três, em produções com exatamente duas variáveis
---


Exemplo
---

$G = (\\{X, Y\\}, \\{a, b\\}, P, X)$    
$P = \\{X → aXa \mid bYb,$
$Y → bYb \mid, bb \\}$

1) já está simplificado
2) lado direito das produções com tamanho >= 2 devem ter apenas variáveis

$P = \\{X → AXA \mid BXB,$  
$Y → BYB \mid BB,$  
$A → a,$   
$B → b\\}$  

3) Lado direito das produções com tamanho >= 3 produçoes com exatamente 2 variáveis

Fazer a produção da sequência de variáveis em várias etapas. Por exemplo: A → BCD, pode ser transformado em A → BX e X → CD

$P = \\{X → AC \mid BD,$  
$Y → BD \mid BB,$  
$C → XA$  
$D → YB$  
$A → a,$   
$B → b\\}$  

Assim obtivemos a Forma Normal de Chomsky

# Exercícios

exercício 1
---

$G = (\\{S, A\\}, \\{1, 0\\}, P, S)$  
$P = \\{S → 1A1,$  
$\\; A → 0A | 1A | 00 | 11\\}$  
$\\quad A → 0A | 1A | 00 | 11\\}$  
$\\! A → 0A | 1A | 00 | 11\\}$
