# Mecanismos de Sincronização

Nem sempre o synchronized funciona, também porque deixa o processo sequencial reduzindo potencial desempenho.

# Mecanismos Básicos

- Protocolos de Acesso
- Spin-lock

---
## Protocolos de Acesso -> Software Puro
- solução para apenas 2 tarefas
- consistem em códigos implementados (sem utilizar chamadas ao sistema) antes da entrada na seção crítica e na saída da seção crítica, fazendo o controle de acesso aos dados compartilhados
- busy waiting, mesmo que o processo estaja esperando permaneça usando o processador
- Métodos
	- Entrada_SC()
 	- Saída_SC() 	

Ao todo são 3 formas de implementar os Protocolos de Acesso, eles não possuem chamadas ao sistema operacional

---
Algoritmo 1:
---
- As threads compartilham uma variável inteira X incializada em 0 ou 1
- Se x=i, então Ti pode executar sua Seção Crítica
- Garante que apena uma threads de cada vez esteja executando sua Seção Crítica

```
Entrada_SC(i){
	while (x != i){
		//espera
	}
}

Saida_SC(i){
	x = 1 – i;
}
```
---
Algoritmo 2:
---
- Algoritmo 1 não retém info suficiente sobre o estado de cada thread
- Algoritmo 2 a variável 'x' é subsitituída pelo vetor booleano flag. Este vetor é compartilhado entre as threds:
- Se flag[i] = true, indica que Ti está pronta para entrar em sua seção crítica.

```
Entrada_SC(i){
	int outro;
	outro = 1 – i;
	flag[i] = true;
	while (flag[outro] == true){
		//espera
	}
}
Saida_SC(i){
	flag[i] = false;
}
```

O algoritmo bem dizer forma uma fila, mas ainda entra num pequeno compartilhamento...

---
Algoritmo 3:
---
- combinação do alg.1 e alg.2
- as threads compartilham a variável inteira e o vetor boolean
- Para entrar em sua seção crítica, Ti
- primeiro define flag[i]=true
- e declara que é a vez da outra thread entrar também (x = outro)
- Se ambas threads tentarem entrar ao mesmo tempo, x é definido como i e como j praticamente ao mesmo tempo
- Apenas uma dessas atribuições perdura
- O valor final de x decide qual das duas threads terá permissão para entrar em sua seção crítica primeiro

```
Entrada_SC(i){
	flag[i] = true;
	outro = 1 – i;
	x = outro;
	while ((flag[outro] == true) && (x == other)){
		//espera
	}
}
Saida_SC(i){
	flag[i] == false;
	X = 1 – id;
}
```

---
---

---
## Desabilitar Interrupções

A mais simples solução para proteção da Seção Crítica é fazer cada processo desabilitar a interrupção enquanto executa Seção Crítica

Um processo pode desabilitar  as interrupções e não habilitá-las

Não usado em máquinas multiprocessadas, pois apenas a CPU que realiza a instrução é afetada e as demais continuarão executando e poderão acessar a memória compartilhada. 

É útil para o SO em si, pois o sistema desativa interrupções enqunato atualiza variáveis

--- 
## Spin-Lock

Hardware de Sincronização.  
Algumas máquinas fornecem hardware especial:
- permitem testar e modificar o conteúdo de uma palavra ou trocar o conteúdo de duas palavras (de forma atômica)

Intrução SWAP - troca conteúdo de uma posição de memória com o conteúdo de um registrador, sem interrupções.

````
Swap(reg, mem)
[mem] -> aux
reg -> [mem]
aux -> reg
````

- Seção Crítica protegia por váriavel em [mem] = lock
- Lock = zero -> Seção Crítica livre
- Lock = 1 -> Seção Crítica ocupada


Vantagens:
- Simples
- Instrução de máquina presente na maioria dos processadores

Desvantagens
- Busy-waiting: processo no laço de espera ocupa o processador
- Se existem vários processos, pode haver postergação indefinida
- Uso limitado a problemas com seção crítica pequena

# Mecanismos Alto Nível

---
## Semáforos


Os semáforos são mecanismos de sincronização eficientes, porém seu uso incorreto por parte dos programadores pode causar comportamentos imprevisíveis nos processos/threads cooperativos

É um tipo abstrato de dado que possui:
- um valor inteiro
- uma fila de processos
- duas operações sobre o semáforo:
	- P = proberen (testar – wait – down – wait) → para parar
	- V = verhogen (incrementar – signal – up – post) → para seguir

Operação P:
- **Decrementa** um valor do semáforo
- testa valor de semáforo, se negativo → processo bloquado e colocado ao fim da fila; se ele não está com seus recursos não adianta ficar forçando barra

Operação V:
- **Incrementa** em um o valor do semáforo
- Se existe processo na fila do semáforo, sinaliza-o
	- Retira o 1o processo da fila do semáforo e
	- Acorda o processo

```
struct Semáforo{
int valor;
int *PCB;
} Semáforo S;

Operação P(S)
	S.valor = S.valor – 1;
	Se S.valor < 0
	bloqueia o processo que executou a
	operação P(S);
	coloca o processo na fila de S;
	Senão
	continua execução;

Operação V(S)
	S.valor = S.valor + 1;
	Se S.valor <= 0
	retira um processo da fila de S;
	acorda o processo que foi
	removido da fila;
	Senão
	continua execução;
```

A ideia é evitar um busy_waiting, avaliar quem pode entrar em execução naquele momento

---
Tipos de Semáforos
---

- Semáforo de Contagem
- Semáforo Binário

---
Uso de Semáforo para Proteção Crítica
---


---
Uso de Semáforos para Estabelecer a Precedência de Operações
---

- A thread que precisa esperar deve efetuar a operação P
- A thread que deve executar primeiro, executa a operação V após a operação

```
//Thread 1 -> essa precisa esperar a Thread 2
	P(S);
	Consulta();

//Thread 2 -> essa precisa ir primeiro
	AtualizaBD();
	V(S);
```

---
## Mutex

É uma versão simplificada do semáforo, ou seja, não possui a capacidade de contar
- são usados para proteção da seção crítica (fazer a exclusão mútua de recursos compartilhados entre processos ou threads cooperativos)
- são fáceis de usar e eficientes

Váriavel pode ter dois estados, livre e ocupado (resumo do mutex)
- apenas 1 bit necessário para representá-lo
- valor zero = estado livre
- valor diferentes de zero = estado ocupado

---
## Monitores

- Sub sistema

Medida primitiva de sincronismo de mais alto nível, para tornar mais fácil a sincronização de processos: **os monitores**
- É trazer uma camada de mais alto nível para implementação, não necessárimente excluir mutex ou semáforo

Pontos que vão controlar e monitorar oque está sendo executado.  
Um monitor é um conjunto de
- Rotinas
- Variáveis e
- Estruturas de dados, todas agrupadas em um tipo especial de módulos ou pacotes.

Propriedade importante, útil para exclusão mútua:
- A qualquer instante, apenas um processo pode estar ativo em um monitor

Como se estivesse encapsulando em um modo do sistema

De modo geral, ao chamar um rotina:
- Suas primeiras instruções verificam se algum outro processo está ativo dentro do monitor.
	- Se sim: o processo que faz a chamada fica suspenso até que o outro processo tenha saído do monitor
	- Se nenhum outro processo estiver usando o monitor, o processo que fez a chamada poderá entrar.

Para estabelecer a precedência de operações, com o uso de monitores, é preciso usar Variáveis de Condição junto com duas operações sobre elas: wait e signal  
Quando uma rotina do monitor não pode continuar, ela executa uma operação wait na variável de condição.  
- Isto causa o bloqueio do processo
- Para acontecer o desbloqueio, outro processo deve executar a operação signal na variável de condição que está esperando.

Após a operação signal, o que pode acontecer conforme:
- Hoare: processo desbloquado executar imediatamente, suspendendo outro
- Brinch Hanse: .....

Se uma variável de condição é sinalizada sem ninguém esperando nela, o sinal é perdido.

Semáforos e monitores foram projetados para ambientes de memória compartilhada

Em Sistemas Distribuídos esses mecanismos não são aplicáveis, uso de Passagem de Mensagens:
- Comunicação síncrona x assíncrona
- RPC – Remote Procedure Call
- RMI – Remote Method Invocation
