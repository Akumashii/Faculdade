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
$\\quad Y → bYb \mid, bb \\}$

1) já está simplificado
2) lado direito das produções com tamanho >= 2 devem ter apenas variáveis

$P = \\{X → AXA \mid BXB,$  
$\\quad Y → BYB \mid BB,$  
$\\quad A → a,$   
$\\quad B → b\\}$  

3) Lado direito das produções com tamanho >= 3 produçoes com exatamente 2 variáveis

Fazer a produção da sequência de variáveis em várias etapas. Por exemplo: A → BCD, pode ser transformado em A → BX e X → CD

$P = \\{X → AC \mid BD,$  
$\\quad Y → BD \mid BB,$  
$\\quad C → XA,$  
$\\quad D → YB,$  
$\\quad A → a,$   
$\\quad B → b\\}$  

Assim obtivemos a Forma Normal de Chomsky

# Exercícios

exercício 0
---

$G = (\\{S, A\\}, \\{1, 0\\}, P, S)$   
$P = \\{S → 1A1,$   
$\\quad A → 0A \mid 1A \mid 00 \mid 11\\}$  

1) simplificação
2) lado direito das produções com comprimento maior ou igual a dois
 
$P = \\{S → CAC,$   
$\\quad A → BA \mid CA \mid BB \mid CC,$  
$\\quad B → 0,$  
$\\quad C → 1\\}$   

3) Transformação do lado direito das produções de comprimento maior ou igual a três, em produções com exatamente duas variáveis
 
$P = \\{S → DC,$  
$\\quad A → BA \mid CA \mid BB \mid CC,$  
$\\quad B → 0,$   
$\\quad C → 1,$   
$\\quad D → CA\\}$   

$G = (\\{S, A, B, C, D\}, \\{1, 0\\}, P, S)$   

exercício 1
---

$G = (\\{S, A\\}, \\{1\\}, P, S)$  
$P = \\{S → 1A1,$  
$\\quad A → 1,$$  
$\\quad S\\}$  

1) simplificação

$P = \\{S → 1A1,$   
$\\quad A → 1 \mid 1A1\\}$  
 
2) transformação produções >= 2 formadas somente por variáveis

$P = \\{S → BAB,$  
$\\quad B → 1$   
$\\quad A → 1 \mid BAB\\}$  

3) transformação produções >= com exatamente 2 variáveis

$P = \\{S → CB,$  
$\\quad C -> AB$   
$\\quad B → 1$  
$\\quad A → 1 \mid CB\\}$

$G = (\\{S, C, B, A\\}, \\{1\\}, P, S)$  

exercício 2
---

$G = (\\{S, X, C\\}, \\{a, b\\}, P, S)$  
$P = \\{S → aSb \mid X,$  
$\\quad X → aa \mid bb,$   
$\\quad C → a \mid b\\}$  

1) simplificação

$P = \\{S → aSb \mid aa \mid bb,$   

2) transformação produções >= 2 formadas somente por variáveis

$P = \\{S → ASB \mid aa \mid bb,$   
$\\quad A → a,$    
$\\quad B → b\\}$  

3) transformação produções >= com exatamente 2 variáveis

$P = \\{S → AC \mid aa \mid bb,$  
$\\quad C → SB,$  
$\\quad A → a,$   
$\\quad B → b\\}$  

$G = (\\{S, A, B, C\\}, \\{a, b\\}, P, S)$  

exercício 3
---

$G = (\\{E\\}, \\{+, *, [, ], x\\}, P, E)$  
$P = \\{S → S + S | S * S | [S] | x\\}$

1) simplificação
2) transformação produções >= 2 formadas somente por variáveis

$P = \\{S → SRS | SQS | XSY | x\$  
$\\quad R → +,$  
$\\quad Q → *,$  
$\\quad X → [,$  
$\\quad y → ]\\}$  

3) transformação produções >= com exatamente 2 variáveis

$P = \\{S → SN | SM | XO | x\$   
$\\quad N → RS,$  
$\\quad M → QS,$  
$\\quad O → SY,$  
$\\quad R → +,$  
$\\quad Q → *,$  
$\\quad X → [,$  
$\\quad y → ]\\}$  
