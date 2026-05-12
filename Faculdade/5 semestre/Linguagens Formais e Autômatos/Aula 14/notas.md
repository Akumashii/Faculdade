# Gramática Ambígua

Gramática Livre do Contexto é uma Gramática Ambígua, se existe uma palavra que possua duas ou mais Árvores de Derivação

$G = ({A}, {x, +, -, [,]}, P, A)$  
$P = \\{A → A + A \mid A → A * A \mid x \mid [A]\\}$

Como pode derivar a palavra x + x * x?

$A → A + A → x + A → x + A * A → x + x * A → x + x * x$  
$A → A * A → A * x → A + A * x → A + x * x → x + x * x$  
$A → A * A → A + A * A → x + A * A → x + A * x → x + x * x$  

Vemos que há mais de uma forma de chegar no mesmo resultado
