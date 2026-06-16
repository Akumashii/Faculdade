problemas que podem ser resolvidos computacionalmente e problemas não resolviveis computacionalmente.  
A capacidade de computação representada pela máquina de Turing e o limite máximo que pode ser atingido por qualquer dispositivo de computação sequencial.

o estudo e definição de Classes de Complexidade de Algoritmos surgiu pelo modelo matemático

Todo problema que por der resolvido por uma máquina de turing que executará em tempo polinomial em um computador real. A máquina de turing NÃO RESOLVE problemas de tempo exponencial pois tende ao infinito muito ligeiramente.    

# Máquina de Turing

- Fita
	- dispositivo de **entrada e saída (armazenamento) de dados**, é dividida em células e cada célula armazena um dado
- Unidade de Controle
	- reflete o estado corrente da máquina, **tem um unidade de leitura e gravação que acessa uma célula da fita de cada vez e pode movimentar-se uma célula para esquerda ou direita**
- Programa
	- função programa ou função de transição é a função que comanda a máquina, **define a sua lógica de funcionamento**

$M = M = (\Sigma, Q, \sigma, q0, F, V, \beta, \otimes) $ 
- $\Sigma$ alfabeto de símbolos de entrada
- Q conjunto de estados da máquina
- $\sigma$ função programa
	- $\sigma : \space Q \times (\Sigma \cup V \cup \\{\beta, \\}) → Q \times (\Sigma \cup V \cup \beta, \\}) \times \\{E, D\\}$
 	- E representa movimento para esquerda
  	- D representa movimento para direita
- q0 estado inicial da fita
- F conjunto de estados finais
- $\beta$ é o símbolo especial que representa as células em branco na fita, pois a fita é infinita;
- V = é o alfabeto auxiliar (alfaveto usado com a pilha)
- $\otimes$ marcador de início da fita, estando sempre na célula mais à esquerda

# Função Programa

formato da função programa da máquina de turing:
- qo --( leitura fita, gravação fita, E/D )--> q1

Unidade de leitura sempre começa mais à esquerda e conforme a

Quando máquina para processamento:
- um estado final, indicando que a palavra de entrada é ACEITA (reconhecida);
- em estado não final, nos casos em que a palavra de entrada é REJEITADA (não reconhecida);
- ou a máquina pode ficar infinitamente em processamento (um loop infinito).

# artigo original turing
TURING, A. M. On Computable Numbers, with an Application to the
Entscheidungsproblem. Proceedings of the London Mathematical Society,
s2-42, n. 1, p. 230–265, 01 1937.

