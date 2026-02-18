# Sistemas Operacionais

Comunicação com usuário, interfaces, uso conveniente
Gerência dos recursos (eficiência)

Um sistema operacional, então, controla e coordena o uso do hardware entre os vários programas aplicativos para vários usuários
- alocador de recursos
- programa de controle
- proporcionar a execução de programas do usuário e faciliar a resolução de problemas do usuário
- SO é um programa que está sempre executando - kernel (núcleo), o restante são programas aplicativos
  - gerencia do processador, da memória principal (RAM) e comunicação entre processos   
- os SO e a arquitetura dos computadores tiveram influência mútua, desenvolvimento nos últimos 35 anos

## 1) Sistemas de Grande Porte
- usados nos mainframes
  - primeiras aplicações comerciais e científicas
- sistemas em lote (batch)
- sistemas multiprogramados
- sistemas de tempo compartilhado

### Sistemas em lote (batch)
processamento sequencial de jobs, monoprogramado e monousuário
- máquinas grandes, operadas a partir de um console
- dispositivos de entrada & dispositivos de saída
- o usuários não intergia diretamente com a máquina
- SO simples
- JOB (tarefa)
   - criado pelo usuário - dados e programa; uso de cartões
   - organizados pelo operador em lote, conforme as características/necessidades
   - passagem entre jobs manual
   - saída aparecia tempo depois
- CPU ociosa
  - Velocidade dos dispositivos de entrada/saída x velocidade CPU
- SO sempre residente na memória - monitor re ........




### Sistemas multiprogramados
sistema passa a ser multiprogramado e monousuário
- Sistemas batch com os discos
  - todas as tarefas no disco ao invés de leitora serial
- Interrupções! -> escalonamento de job -> multiprogramação
- Tarefa pode esperar por evento ou E/S
- Vários jobs na memória
  - sobrepor operações de E/S com processamento

- SO precisa tomar decisões
- Pool de Jobs no disco
- Escalonamento de Jobs
- Escalonamento de CPU
- gerência de memória
- gerência de E/S

### Sistemas Tempo Compartilhado (Timesharing)
sistema passa a ser multiprogramado e multiusuário

- CPU executa vários jobs alternando entre eles
  - as trocas ocorrem com frequência
  - os usuários podem interagir com o programa em execução -> possuem terminal!
  - tarefas curtas = muita E/S
- Há uma divisão do tempo de processamento entre os vários usuários, tempo
de resposta
  - permite aos usuários compartilharem o computador ao mesmo
- Multiprogramação
  - cada usuário tem um programa na memória (pelo menos)
  - compartilhamento de tempo
  - sistema interativo -> uso CPU x uso E/S
  - escalonamento de CPU
  - gerência de memória
  - memória virtual
  - sistemas de arquivos
- Tornaram-se comuns no início da década de 70

## 2) Sistemas de Computadores Pessoais (desktop)
Inicialmente, não possuíam recursos para proteger o SO, não eram multiusuário nem multitarefa

- MULTICS

- Sistemas monousuário
  - Ex.: MS-DOS, Windows 3.x
- Sistemas multiusuário
  - Suportam várias sessões de um usuário em um computador
  - Ex.: Win NT, Unix
- Sistemas monotarefa
  - Ex.: MS-DOS
- Sistemas multitarefa
  - Não-Preemptivo: Ex.: Windows 3.x, 9x (16 bits)
  - Preemptivo: Ex.: Win NT, OS/2, Unix, Windows 9x (32 bits)
  - Beneficiaram-se de vários conceitos de mainfraimes
 
## 3) Sistemas Paralelos
- Vários processadores (multiprocessados) compartilhando barramento, clock, memória
- Fortemente acoplados
- Comunicação através da memória
- Motivos:
  - Maior througput
  - Mais trabalho em menos tempo
  - Maior confiabilidade
- Multiprocessamento simétrico (mais comuns)
  - Todos os processadores são iguais
  - Um processo mestre controla o sistema (SMP - Symmetric Multi-Processing)
  - Sustemas Operacionais como Win NT, Solaris, Unix, OS/2, Linux possuem suporte a SMP

## 4) Sistemas Distribuídos
- 1990 – crescimento das redes de computadores
- Coleção de computadores que não compartilham memória ou clock,
interconectadoes e trabalham de forma a disponibilizar um serviço
- Sistemas fracamente acoplados
- Comunicação acontece por trocas de mensagens
- Linhas de comunicação: barramentos, linhas telefônicas
1) Sistemas Cliente-Servidor
2) Sistemas peer-to-peer
3) Sistemas Operacionais Distribuídos

## 5) Sistemas de Tempo Real
- Sistemas com propósito específico
- Aplicação dedicada
- Processamento precisa ser feito dentro dos limites de tempo definidos
- Quase não é encontrada memória virtual nestes sistemas, pois, a alocação na memória física reduz tempo de resposta

## 6) Sistemas para dispositivos móveis

# Considerações Finais

A base do sistema operacional é a multiprogramação. 

SO
- oferece ao usuário um ambiente conveniente para o desenvolvimento e execução de programas, não
somente para usar o computador é conveniente mas para desenvolvedores também
- gerencia os recursos de um sistema de computação de forma a garantir a correta e eficiente
utilização dos mesmos
