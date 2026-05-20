# Deadlock

## Impasses


"Quando dois trens se aproximarem um do outro em um cruzamento, ambos deverão parar completamente e nenhum dos dois deverá dar a partida novamente até que o outro tenha passado.” - Lei real aprovada no Kansas 


Para utilizar um recurso ele deve primeiro solicitá-lo:
- Pedido (se não for satisfeito, o processo que solicitou entra no estado de espera)
- Uso
- Liberação
- pedido e liberação de recurso são chamadas aos sistema (system calls)

Definição: n processos estão em deadlock quando cada um dos n estiver bloqueado à espera de um evento que somente pode ser causado por um dos n processos do conjunto

Tipos de Deadlock:
- Mesmo tipo de recursos;
	- Sistema com 3 unidades de fita; há 3 processos, cada um mantendo uma unidade neste momento e para terminar a operação solicitam mais uma unidade de fita.
- Recursos diferentes
	- P1 alocou a fita; P2 alocou a impressora; para continuar, P1 solicitou a impressora e P2, a fita.


## Condições Necessárias para Ocorrência de Deadlock


- Exclusão Mútua
	- Processos possuem seção crítica de código e deve ser executada com exclusão mútua
	- Um processo que solicita um recurso compartilhado não poderá utiliza-lom se este estiver em uso, e deverá esperar até o recurso ter sido liberado
- Posse e Espera
	- Um processo tem a posse de um recurso e espera por outro recurso alocado a outro processo.
- Não-preempção
- Espera Circular

## Grafo de Alocação de Recursos


é utilizado para descrever deadlocks:
- Conjunto de Vérticies(processos): P = {P1, P2, ..., Pn}
- Conjunto de Recursos: R = {R1, R2, ..., Rn}
- Arestas:
	- Pedido: P1 solicitou R1 e está esperando pelo recurso -> P1 🡪 R1 (aresta de pedido)
	- Atribuição ou Alocação: R1 foi alocado ao processo P1 -> R1 🡪 P1 (aresta de atribuição)

Se grafo de alocação não possuir um ciclo o sistema não entrará em deadlock  
Se houver ciclo, o sistema poderá ou não estar em deadlock, para os sistema estar em deadlock, as 4 condições de ocorrência devem estar presentes.

## Métodos para tratar Deadlocks

## Prevenção de Deadlock

A prevenção de deadlock consiste em eliminar uma das 4 condições para ocorrência do deadlock.

- Exclusão Mútua
	- Dificilmente alcançado
- Posse e Espera
	- Baixa utilização de recursos, recursos alocados e não utilizados por longo período longo
	- Possibilidade de paralização
- Não-preempção
- Espera Circular
	- Impor ordem total sobre todos os tipos de recursos e exigir que cada processo solicite o recurso em ordem ascendente de enumeração
	- baixa utilização dos recursos; througput reducido (taxa de transmissão reduzida); paralização do sistema

## Impedimento de Deadlock

Método alternativo para evitar deadlocks

Examina o estado (disponível, alocada, para quem...) de alocação de recursos para garantir que não aconteça espera ciruclar. Estados:

## Detecção

.
.
.

Utiliza Grafo de Espera

Quando deve ser chamado?
- se os deadlocks ocorrem com frequência
- quando um pedido não pode ser atendido imediatamente (pode ser uma deadlock), nesse caso chama o algoritmo
- 1x/hora
- Utilização da CPU < 40%

## Recuperação de Deadlock

Quando detectado pode fazer:
- deixar o operador tratar o problema manualmente; ou
- o sistema recupera o deadlock automaticamente
	- término do processo (interrompe a espera circular
	- preempção de recursos

## Término do processo

O sistema recupera todos os recursos alocados aos processos terminados. Assim ele pode:
- Abortar todos os processos em deadlock -> auto custo pois descarta toda a computação até o momento
- Abortar um processode cada vez até eliminar o ciclo de deadlock -> auto custo, após cada processo ser abortado o algoritmo de detecção deve ser chamado. E por qual processo deveria começar?


Se o término for parcial é preciso determinar qual(is) processo(s) serão abortados. Geralmente, opta-se por terminar os processos de custo mínimo

### Fatores para escolha

- Qual a prioridade do processo?
- Quanto tempo de computação já foi realizado e quanto tmepo necessita para terminar?
- Quantos e que tipo de recursos foi utilizado (esses são de fácil preempção)?
- Quantos recursos o processo ainda precisa?
- Quantos processos precisarão ser terminados?
- O processo é interativo ou em batch?

## Preempção de Recursos

Para recuperar deadlock, pode-se fazer a preempção sucessiva de alguns recursos e esses recursos são designados a outros processos até que o ciclo de deadlock seja quebrado.

Três questões a serem analisadas:
- Seleção de uma vítima
- Rollback
- Starvation


