# Escalonamento (Schedule) 

## Sumário:
- Introdução
- Ciclos de CPU e I/O
- Escalonador de CPU
- Escalonamento
- Dispatcher
- Critérios de Escalonamento
- Políticas de Escalonamento

---

## Introdução

Escalonamento é a base para Sistema Operacional Multiprogramado. Escalonamento de:
- Processos
- Threads (no nível do Kernel)

O Escalonamento é o "coração", função fundamental dos Sistemas Operacionais
- Quase todos os recursos são escalonados antes do uso
- CPU é o principal recurso -> ponto central para o projeto de Sistemas Operacionais

Podemos dizer que, CPU sem trabalho útil é igual a tempo perdido (ociosidade). Processos passam para o estado "em Espera", a CPU pode ocupar-se com outro processamento

Multiprogramação:
- Procura utilizar o tempo de forma produtiva, flexível, eficiênte
- Vários processos na memória para execução

## Ciclos de CPU e I/O

Altera entre ciclos, a execução de um processo alterna entre
- ciclos de CPU
- ciclos de I/O

Processos limitados:
- Processo limitado por I/O, possui muitos ciclos de surtos curtos de CPU
- Processo limitado por CPU, alguns ciclos de surtos longos de CPU

Essa distribuição deve ser observada para escolha do **algoritmo de escalonamento**

## Escalonador de CPU

#### Escalonamento executado pelo Escalonador de Curto Prazo

Escolhe um processo na Fila de Processos Prontos

Objetivos:
- Aumentar a produção do sistema (througput)
- Diminuir o tempo de resposta aos usuários
- Manter o processador ocupado o máximo possível
- Diminuir o tempo médio de espera na fila do processador (turnaroundtime), processador não fique parado nem fique muito tempo trabalhando

Uma fila de escalonamento não é necessariamente é implementada como FIFO (First In First Out). Pode ser:
- Fila de prioridades
- Lista encadeada desordenada
- Árvore

[imagem_diagrama_escalonamento]

## Escalonamento

O Escalonamento por ser:
- Preemptivo
- Não-Preemptivo ou Cooperativo

#### Escalonamento Preemptivo

As interrupções estão habilitadas, então, a execução pode ser interrompida.

Há custo associado à coordenação do acesso aos dados compartilhados

Influencia no projeto do kernel do SO
- Chamada ao Sistema: o Kernel pode estar ocupado com outro processo
- Podem gerar mudança em dados compartilhados
- É necessária a conclusão de uma chamada ao sistema ou operação I/O antes de fazer a **troca de contexto**, troca de foco

Devido ao escalonamento preemptivo, alguns SO são implementados de forma a esperar a conclusão de uma chamada ao sistema ou de bloco de operações de I/O antes de ser efetuada a troca de contexto.
- Simplicidade do Kernel
- Versões do Unix
- Não eficiente para sistemas de tempo real

Sistema de tempo real é um sistema que responde dentro de um tempo definido, nomeclatura "Dead Line". Ele tem um tempo máximo para responder, e importa o tempo de começo do processo e o tempo de término do processo.

Há possibilidade de habilitar/desabilitar as interrupções a fim de proteger uma seção de código

## Dispatcher = Executor

Quem executa de fato é o Dispatcher. Módulo que dá o controle da CPU ao processo escalonado:
- Passagem para o modo usuário/supervisor
- troca de contexto:
	- Salva no descritor de processo ou na pilha do processo
	- Ao ser restaurado, o Program Counter (PC) indica o ponto de continuação da execução
	- Mudança para posição adequada no programa do usuário conforme o Program Counter (PC)

## Critérios de Escalonamento

São critérios utilizados para comparação de algoritmos/políticas de escalonamento

O escalonamento procura maximizar os seguintes critérios:
- Utilização de CPU: Deve ficar o maior tempo possível ocupada
- Throughput: Número de Processos terminados por unidade de tempo. 
	- Por exemplo: 1 processo / hora; 10 processos / segundo

O escalonamento procura minimizar os seguintes critérios:
- **Tempo de Retorno**: É o tempo entre a Submissão e a Conclusão do Processo. Envolve o tempo na fila de prontos, em execução, usando dispositivos...
- **Tempo de Espera**: Tempo esperando na fila de processos prontos (não afeta operações de I/O)
- **Tempo de Resposta**: É o tempo entre a Submissão e a Primeira Resposta do processo não considera a velocidade do dispositivo de saída)

## Políticas de Escalonamento

As políticas de Escalonamento constituem-se em algoritmos de escalonamento que selecionam quais processos devem utiizar a CPU em determinado instante. As principais políticas são:
- First-Come, First-Served (FCFS) ou First-In, First-Out (FIFO)
- Shortest Job First (SJF) ou Shortest Job Next (SPN)
- Escalonamento por prioridade
- Round-Robin ou Revezamento Circular ou Fatia de Tempo

Existem ainda outros algoritmos ................

---

# Algoritmos de Escalonamento
- Escalonamento First-Come, First-Served (FCFS) ou First-In, First-Out (FIFO)
- Escalonamento Shortest Job First (SJF)
- Escalonamento por Prioridade
- Escalonamento Round-Robin (Revezamento)
- Escalonamento por Múltiplas Filas
- Escalonamento por Múltiplas Filas com realimentação

## First-Come, First-Served (FCFS) ou First-In, First-Out (FIFO)

É o algoritmo mais simples de implementar o processo que solicita a CPU primeiro, recebe primeiro, ou seja, conforme os processos vão chegando são inseridos no fim da fila de prontos

É implementado por uma FIFO: um processo entra na fila de processos prontos e seu PCB é ligado ao final dela. 

O processo utiliza CPU até o término do processamento, ou realize uma chamada ao sistema. Quando a CPU é liberada, ela é alocada ao processo que está no início da fila.

O processo que entra em execução é removido da fila de prontos

[imagem_tempo_medio_execucao_SJF]

Geralmente, apresenta tempo de espera longo, pois não favorece os processos I/O bound.

#### Situação Dinâmica

- Um Processo limitado pela CPU: obtém e detém a CPU.
- Muitos Processos limitados por I/O: terminam sua operação de I/O e passam para Prontos
- Dispositivos de I/O ociosos
- Processo limitado pela CPU termina e passa para operação de I/O
- Todos os Processos limitados I/O são executados pois tem surtos curtos de CPU
- Executam rapidamente e voltam para a fila de I/O
- CPU ociosa
- Processo limitado pela CPU mais uma vez vai para fila de prontos e retorna para a CPU
- Processos limitados por I/O esperam na fila de prontos até a CPU estar disponível

## Shortest Job First - SJF

Para cada processo é associada a duração de seu próximo ciclo de surto de CPU. quando a CPU está disponível o processo a ser escalonado é o que tem surto de menor duração. Se houver empate, usa-se o escalonamento FCFS (o anterior)

É um algoritmo ótimo, tempo de espera médio é mínimo!

[imagem_tempo_medio_execucao_SJF]

#### Problema!!
- Para o escalonamento de CPU (escalonador de curto prazo) não existe como saver a duração do próximo ciclo de surto de CPU
- Em sistemas batch, o usuário pode especificar esse tmepo quando submete o job
- Pode-se fazer uma previsão: espera-se que o próximo ciclo de surto de CPU seja semelhante em duração aos anteriores

## Escalonamento por Prioridade 

É uma fila com prioridade.

SJF é um caso de escalonamento por prioridade, é dada para aos processos de menores ciclos de surto de CPU 

Na política de Escalonamento por Proridade, uma prioridade é associada a cada processo e a CPU é alocada ao processo de mais alta prioridade. Se houver empate, o escalonamento FCFS é utilizado.

### Prioridades

São definidas em faixa de valores, escala de prioridades:
- 0..10
- 0..255

É pré-definido se a prioridade mais alta é determinada pelo maior ou menor número, consideraremos o menor número como maior prioridade

As Prioridades podem ser: 
- **Interna**
	- Representam alguma quantidade mensurável para calcular a prioridade do processo (tempo, memória, arquivos abertos, razão entre surtos I/O e CPU)
- **Externa**
	- Definida por critérios ao Sistema Operacionaç (importância do processo, tipo, quantiadde paga pelo uso no computador, departamento...)

 Pode ser não-preemptivo ou preemptivo.

Por exemplo, na seguinte situação: **um processo chegou no sistema durante a execução de outro e o processo que chegou tem prioridade mais alta**
- Escalonamento não-preemptivo
	- o processo é colocado no ínicio da fila, pois tem prioridade mais alta
- Escalonamento preemptivo
	- o processo em execução é interrompdo e a CPU é alocada ao novo processo

#### Problema!! 

Problema: Bloqueio por tempo indefinido ou starvation ou postergação indefinida
- processos de baixa prioridade podem ficar esperando pela CPU indefinidamente

Solução: 
	- Técnica de Envelhecimento (aging) consiste em aumentar gradativamente a proridade dos processos que estão na fila de Prontos durante muito tempo, para favorecer sua execução. Assim ele não é esquecido eternamente

## Escalonamento Roud - Robin (RR) ou Revezamento Ciruclar ou Fatia de Tempo

"Tempinho pra cada um processar", adequado para Sistemas de Tempo Compartilhado.

É o escalonamento FCFS acrescido da preemção para alternar entre os processos.

O sistema define um quantum de tempo(fatia) -> 10ms, 100ms, 1000ms ...

O processador percorre a Fila de Prontos, alocando os processos por um intervalo de tempo de até um quantum. É mantido por FIFO: novos processos são adicionados ao final da fila.

Fluxo de processo:
- Escalonador
- Seleciona o primeiro processo da fila
- Aciona um tmeporiador para interromper o processamento depois de um quantum
- Submete o processo à CPU

Assim, pode ocorres duas situações:
1) Surto de CPU de menos de um quantum
	- O próprio processador libera CPU
	- O próximo processo é escalonado
2) Surto de CPU excede um quantum
	- Temporizador esgotará o tempo de execução do processo atual
	- Acontece Interrupção do SO
	- Há Troca de Contexto dos processos
	- Processo Interrompido vai para o final da fila de prontos
	- O próximo processo é escalonado

[imagem_processamento_escalonamento_round]

O algoritmo Round Robin é preemptivo, se houver 'n' processos na Fila de Prontos e 'q' quantum. Então:
- Cada processo terá 1/n do tempo da CPU em lotes de no máximo q unidades de tempo
- Cada processo deve esperar no máximo (n-1) q unidades de tempo até o próximo quantum

Desempenho depende do tamanho do quantum:
- Se o quantum for muito grande -> ficará semelhante os FCFS
- Se o quantum for muito pequeno -> compartilhamento de processador -> como se cada um dos n processos tivesse seu próprio processador executando a 1/n da velocidade real do procesador (execução com travamentos: executa e para, executa e para...)
- Tempo de Retorno também depende do tamanho do quantum
- 80 % dos surtos de CPU < quantum (ideal, eu acho)

## Escalonamento por Múltiplas Filas

Utilizado em casos onde os processos podem ser classificados em diferentes grupos
como por exemplo:
- Processos de Primeiro Plano (interativos)
	- podem ter prioridade em realação aos outros processos
- Processos de Segundos Plano (batch)
	- possuem diferentes tipos de resposta, portanto podem ter escalonamentos distintos

 .
 .
 .
 .

 
## Escalonamento por Múltiplas Filas com Realimentação

.
.
.

Se um processo utilizar surto de CPU excessivo, é movido para uma fila de
menor prioridade. Logo: os processos limitados por I/O estão nas filas de prioridade mais alta

Possui técnica de Envelhecimento: processo que espera demais em uma fila
de baixa prioridade passa para uma fila de maior prioridade

Exemplo: 3 filas(F0, F1, F2)
- F0(quantum 8) -> F1(quantum 16) -> F2 (FCFS) -> F0...
- Executa todos os processos das filas nessa sequência
- Se chegar um processo na F1, interrompe o da F2. O mesmo acontece se chegar um processo na F0
- F2 somente executa quando F0 e F1 estiverem vazias

Considerações sobre o exemplo:
- Prioridade mais alta é dada aos processos com Surto de CPU <= 8 ms
- Processos com Surto de CPU entre 8 e 24 ms são rapidamente atendidos
- Processos com Surto de CPU maior que 24 ms vão para a F2
- Os processos limitados por I/O estão nas filas de prioridade mais alta 

Esse escalonador é definido pelos seguintes parâmetros:
- Número de filas
- Algoritmo de escalonamento para cada fila
- Método para remover/rebaixar processos
- Método para determinar em que fila entrará determinado processo
