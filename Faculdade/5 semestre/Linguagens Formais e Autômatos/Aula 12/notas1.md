# Autômato com Pilha

Na hierarquia das linguagens a Linguagem Regular(tipo 3) é a mais básica, logo após temos a Linguagem Livre do Contexto(tipo 2) (LLC)
- Livre de Contexto -> análise sintática
	- Regular -> análise léxica

Linguagem Livre de Contexto consegue contemplar maior complexidade para as expressões, como construções de bloco estruturadas e "duplo balanceamento", por exemplo: "{ }", "(...(...))"

Analisadores sintáticos, tradutores, compiladores, processadores de texto são implementados com o uso dos formalismos das Linguagens Livres do Contexto.

---

Autômato com Pilha (AP) é um formalismo reconhecedor aplicado às Linguagens Livres do Contexto

Autômato com Pilha difere do Autômato Finito, formalismo reconhecedor das Linguagens Regulares, por utilizar uma memória auxiliar: uma memória do tipo pilha.

É um autômato não determinístico.

---
Autômato com Pilha é uma máquina composta por: Fita Entrada, Pilha e Unidade de Controle

- Fita de entrada  
	- Dispositivo de entrada que contém a informação a ser processada. A fita é infinita à direita. 	- Cada célula da fita armazena um símbolo pertencente a um alfabeto de entrada. Não é possível gravar sobre a fita. A palavra de entrada ocupa toda fita.
- Pilha  
	- É o dispositivo de armazenamento auxiliar do Autômato.
	- Cada célula da pilha armazena um símbolo do Alfabeto Auxiliar. O Alfabeto Auxiliar pode ser o mesmo alfabeto de entrada.
	- O Autômato pode gravar símbolos na pilha.
	- O Autômato pode ler símbolos da pilha. Ao ser lido um símbolo da pilha, ele é removido.
- Unidade de Controle  
	- Reflete o estado corrente da máquina.
	- Possui uma unidade de leitura (cabeça da fita) que acessa uma célula da fita de cada vez e movimenta-se exclusivamente para a direita (uma célula). É possível testar se a palavra de entrada foi completamente lida.
	- Possui também uma unidade de leitura/escrita para a pilha (cabeça da pilha). Para gravar, move-se para cima e para ler, move-se para baixo. Acessa um símbolo de cada vez; sempre está no topo. É possível testar se a pilha está vazia.

---
Definição
---

Um Autômato com Pilha é uma 6-tupla: 
- $M = M = (\Sigma, Q, \sigma, q0, F, V)$
- V = é o alfabeto auxiliar (alfaveto usado com a pilha)

---
Função Programa do AP
---
'?' -> palavra que testa.

- $(a, \varepsilon, X)$ significa ler ‘a’ da fita, não ler da pilha, gravar ‘X’ na pilha.
- $(a, X, \varepsilon)$ significa ler ‘a’ da fita, ler ‘X’ da pilha, não gravar na pilha.
- $(?, ?, \varepsilon)$ O símbolo ? é um teste. Se estiver na primeira posição, testa se toda a palavra da fita foi lida. Se estiver na segunda posição, testa se a pilha está vazia.
- $(\varepsilon, \varepsilon, \varepsilon)$ É o movimento vazio: não há leitura da fita e não há leitura e gravação na pilha.

---
Critério de Parada do Autômato com Pilha
---

Há duas abordagens que podem ser utilizadas como critério de Parada do Autômato com Pilha:
1) A Pilha está vazia e o Autômato aceita a palavra quando chegar o estado final $(q_f)$
2) A Pilha possui um valor especial (símbolo inicial) e não há estado final no autômato. A palavra é aceita quando a Pilha possuir o símbolo inicial.

As palavras podem pertencer a um dos três conjuntos:
- ACEITA(M) ou L(M): são palavras de $\Sigma$* aceitas. Um dos caminhos do AP assume $(q_f)$
- REJEITA(M): são palavras de $\Sigma$* rejeitadas. Todos caminhos do AP rejeitam a palavra.
- LOOP(M): palavras de de $\Sigma$* onde o AP fica processando indefinidamente. Pelo menos um caminho está em loop infinito e os demais rejeitam a palavra.

---
Exemplo
---

$L = \\{a^nb^n\\} \mid n>=1\\}$

(n=3)  
fita de entrada: aaabbb  
Pilha (memória auxiliar):
- quando adiciono 1 'a', acrescento A na pilha
- quando vir o 'b', removo A na pilha

O resto nos slides da aula, exemplo complexo.
