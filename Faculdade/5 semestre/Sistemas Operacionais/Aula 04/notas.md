# Processos

## Escalonamento de Processos

### Filas de Escalonamento

- Filas de Jobs (Novo), todo processo que entra no sistema é colocado nessa fila
- Filas de Prontos (Pronto), processos que estão na memória e estão prontos para serem executados
- Filas dos Dispositivos (Espera),
  - Lista de processos esperando por um determinado dispositivo
  - Quando o dispositivo está ocupado, o processo é colocado na fila do dispositivo

### Diagrama de Processos

Fila de Prontos ------> CPU, motivos para interrupção da CPU para Fila de Prontos

### Escalonador (scheduler)

Responsável por selecionar o processos (nas várias filas) que será alocado na CPU. Processos migram entre várias filas de escalonamento durante sua vida

Há três tipos de escalonador, se diferenciam na frequência em que são chamados:

#### Escalonador de Longo Prazo
  - utilizado com menos frequência (minutos)
  - seleciona processos e os carrega na memória para execução
  - deve selecionar processos afim balancear a carga do sistema para de não sobrecarregar a CPU
  - controla o grau de multiprgramação, número de processos na memória e grau estável
  - chamado somente quando os processos saem do sistem
  - seleciona uma boa combinação de:
    - processos I/O bound, muito dele -> fila de prontos vazia
    - processos CPU bound, muito dele -> fila de I/O vazia, dispositivos sem uso

#### Escalonador de Curto Prazo
  - está associada ao dispositivo mais rápido, a CPU
  - muito utilizado, deve selecionar novos processos com bastante frequência (milisegundos)

#### Escalonador de Médio Prazo
  - nìvel intermediário de escalonamento
  - usa a idéia de que pode-se ter vantagens em remover o processo na memória, reduzindo o nível de multiprogramação
  - útil para:
    - melhorar a combinação de processos
    - mudança de requisitos durante a execução dos processos compromete a memória disponível 
  - swapping, é este processo de aliviar a RAM para quanto não cabe mais data nela.
    - swapping é uma parte do disco rígido utilizada como memória virtual e extensão da RAM 

## Descritor de Processos ou PCB (Process Control Block)

estrutura de dados que vai para fila, é representado pelo:
- Espaço de Endereçamento (armazenamento da imagem do processo)-
- Estruturas Internas do Sistemas (áreas de memórias, tabelas internas, ...)
- Contexto de Execução (pilhas, dados, ...)

área de dados, 
na área de código -> PC (program counter)
na área de pilha -> SP (stack pointer)

Código + Pilha = linha (ou fluxo) de execução de instrução

Cada processo é representado pelo SO por m PCB (repositório de informações de cada processo)

## Operações nos Processos

### Comandos

- fork (princípio da programação concorrente)
  - permite a criação de um segundo fluxo de execução, como se bifurcasse, uma subrotina
  - gerência do processador cria estrutura de dados necessárias e insere o processo na fila de prontos
    - o processo de endereçamento deve ser igual ao do processo que o criou
  - Quanto usamos o fork utilizamos o paradima de programação SPMD (Single Program, Multiple Data), 
- exit
- wait
