# Sumário
- programação concorrente
- processos cooperatiovs
- problema do produtos-consumidor
- condição de corrida
- seção crítica
- requisitos de uma solução a seção
- mecanismos de sincronização

# Programação Concorrente

Principal ponto de estudar SO, caracterizada pela execução de vários processos que cooperam entre si que realizam uma determiada tarefa.  
Possui vários fluxos de execução de instruções, necessidade de troca de dados entre eles.

Programa executado por um único fluxo é chamado de programa sequencial.

Nas arquiteturas com múltiplos processadores na execução de um programa concorrente, acontece o paralelismo real.  
os vários processos ou threads são escalonados aos dferentes processadores tornando a execução paralela(simultânea)

Em arquiteturas monoprocessador, programa concorrente acontece alternadamente.   
diferentes processos ou threads são escalonados a mesma CPU e não executam simultaneamente, paralelismo aparente

Cluster -> diversos computadores ligados em paralelo.

---
Motivação para o uso da programação concorrente:
---
- permitir a exploração do paralelismo real existem em máquinas multiprocessadoras -> aumento de desempenho da aplicação
- permitir realizar operaçõe simultâneas de processamento e E/S ou seja, enquanto um fluxo de execução de instrução realiza operações de CPU, executam operações de entrada e saída.
- isso também possibilita a obtenção de desempenho nas aplicações, diminuindo ociosidade do processador enquanto E/S são realizadas.

Em relação a programação sequencial a programação concrrente é bem mais complexa:
- Há necessidade de projetar e implementar as operações dos diferentes threads/processos executando concorrentemente, de forma que os dados comuns a eles mantenham a consistência, os processos/threads mantenham a execução (não fiquem em espera indefinida)) e o resultado final da aplicação seja correta. Independente da velocidade de execução dos processos

A depuração de um programa concorrente é tarefa árdua comparada à execução sequencial.

---
# Processadores Cooperativos
---

---
# Problema Produtor-Consumidor ou Problema do Buffer Limitado (bounded buffer)
---

A programação concorrente implica no comartilhamento de recursos, como variáveis, estruturas de dados, registros, arquivos, banco de dados. O Acesso aos recursos compartilhados deve ser feito mantendo-se o correto e coerente estado do sistema.  

O problema do compartilhamento de recursos pode ser exemplificado com um problema clássico de sincronização em sistemas operacionais, chamado
- problema do Produtor-Consumidor ou Problema do Buffer Limitado (bounded buffer)

Segundo Silberschatz(2008) o problema do produto-consumidor possui:
- um buffer de tamanho limitado compartilhado entre os processos
- há um processo produtor que insere um item no buffer a cada execução
- há um processo consumidor que remove um item do buffer a cada execução
- há uma variável inteira (count) compartilhada entre os processoss que é utilizada para contar quantos itens existem no buffer

---
Este problema mostrauma relação entre processos, astante comum em SO, como exemplo: pode ..........
.  
.  
.  
.  

Neste probelma, pode-se identificar as seguintes situações de sincronização
- quando o buffer estiver cheio:
	- o processo produtor não poderá executar e deverá esperar até que exista o espaço no buffer (até que um item seja consumido)
- quando o buffer estiver vazio:
	- o processo consumidor não poderá executar e deverá esperar até que um item seja inserido no buffer

quando um processo está atualizando dados compartilhados.........



---
# Condição de corrida
---

como a execução dos processos é concorrente pode acontecer um erro com o valor da variável contadora. Ao ser incrementada ou decrementada a variável cont, as instruções são traduzidas pelo compilador para:

// cont = cont + 1;
- MOVE cont, ACC
- INC ACC
- MOVE ACC, cont

// cont = cont = 1
- MOVE cont, ACC
- DEC ACC
- MOVE ACC, cont

Esta 1 instrução na verdade são, para o compilador, 3 instruções! assim permitindo brecha para erro. Na execução sequencial não há problema de concôrrencia de variável

.  
.  
.  

Para evitar esse problemas com variável, estes processos devem ser feitos de forma sequêncial.

Exemplo, problema de variável:
- Produtor: MOVE cont, ACC 			//ACC=2
- Produtor: INC ACC 				//ACC=3
- Consumidor: MOVE cont, ACC 		//ACC=2
- Consumidor: DEC ACC 				//ACC=1
- Produtor: MOVE ACC, cont 			//ACC=3
- Consumidor: MOVE ACC, cont 		//ACC=1

Os processos se meteram um no outro utilizando a mesma variável 'cont' (contadora). O valor final deveria ser 2

Solução:
- Produtor: MOVE cont, ACC 			//ACC=2
- Produtor: INC ACC 				//ACC=3
- Produtor: MOVE ACC, cont 			//ACC=3
- Consumidor: MOVE cont, ACC 		//ACC=3
- Consumidor: DEC ACC 				//ACC=2
- Consumidor: MOVE ACC, cont 		//ACC=2

.  
.  
.  

---
# Seção Crítica
---

A seção crítica é uma seção (parte) de código de um processo ou thread onde acontece a manipulação de dados que são compartihlados com outros processos ou threads e deve executar de forma atômica com as interrupções desabilitadas. Para evitar a Condição de Corrida deve-se proteger a seção crítica do código.

Quando um thread possuem seção crítica, enquanto yn dekes estiver executando sua ção crítica, nenhum outro pode executar a sua. Acesso à seção crítica é **mutuamente execlusivo**.

---
Requisitos de uma solução crítica
---

1) Exclusão Mútua
- e Ti está executando sua seção crítica, qualter Tj, onde j diferente de i não poderá executar sua seção crítica. Isto significa que dois ou mais processos........
2) Progresso
- Somente threads executando sua sção não crítica participam da decisão de quem será o próximo a executar sua seção crítica; nenhum processso fora de sua seção crítica pode bloquear a execução de um outro processo.
3) Espera Limitada
- processos não devem esperar indefinidamente para entrar em sua Seção Crítica. Deve existir um limite para espera
4) Solução independente da velocidade dos fluxos
- A solução deve ser independente da velocidade e quantidade de processadores existentes e da quantidade de threads e processos......

Soluções erradas ao problema da seção crítica apresentam.......

---
# Mecanismo de Sincronização
---

.  
.  
.  
.  
.  
