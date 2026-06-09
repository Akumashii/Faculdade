# Introdução às Linguagens tipo 1 e tipo 0

O estudo das LER e LSC explora os limites que pode ser reconhecido computacionalmente.  
ciência da computação sempre existiu, não foi somente com a chegada dos computadores esse apenas foi o produto de todos os pensamentos anteriores de milênios

No final do século XX cientistas buscavam definir um modelo computacional suficientemente genérico capaz de implementar qualquer função computável (algoritmo), viabilizar a exploração dos limites do que pode ser computado.  
Em 1939 Alan Turing, matemático, ele propôs um formalismo para a representação de procedimentos efetivos -> Modelo Teórico de Computação Sequencial   
A máquina proposta é o autômato mais geral hipotéticamente possível, formalização de um algoritmo. Assim atualmente a Máquina de Turing é usuda como modelo teórico da computação

Intenção foi simular as atitudes humanas relacionadas à computação, uma pessoa com papel, lápis e borracha, pode escrever e apagar 

Foi a fundamentação teórica para o desenvolvimento dos computadores atuais, como o de VonNewman

Tese de Church: Qualquer algoritmo pode ser processado por uma máquina de Turing.  
É impossível demonstrar formalmente se a máquina de Turing é de fato o mais genérico dispositivo de computação, assim fica como Hipótese de Church-Turing

# Linguagens Enumeráveis Recursivamente (LER) -> TIPO 0

Linguagens deste tipo podem ser aceitas por uma Máquina de Turing

Gramática Irrestrira -> qualquer coisa de um lado e qualquer coisa do outro lado, dificil de implementar



# Linguagem Sensível ao Contexto (LSC) -> TIPO 1

Máquina de Turing com Fita Limitada

# Conjunto das Classes
- LER -> máquina de turing e gramática irrestrita
- LSC -> máquina de turing com fita limitada e gramática sensível ao contexto
- LLC -> automato com pilha e gramática livre do contexto
- LR -> automato finito deterministico e linguagem regular e gramática regular
