# Threads

Processo, um único fluxo de execução, espaço de endereçamento, descritores de arquievos abertos, permissões de acesso , quotas

- Threads
	- múltipos fluxos de execução
	- Multithreads -> mesmo espaço de endereçamento. 
	- Associa vários fluxos de execução a um único processo

Um fluxo de instrução é implementado através do contador de programa (PC) e do Stack Pointer (SP)


Processo leve, unidade básica da utilização da CPU existem no interior de um processo:
- Descritor de Thread
	- ID Thread
	- Prioridade
	- Contador de Programa
	- Registradores
	- Pilha
- Compartilha com Threads do mesmo processo
	- Espaço de endereçamento
	- Gerência é mais leve
	- Chaveamento de contexto mais rápido


Aplicações em PC são multithreading
- Thread único, um cliente de cada vez
- Multithread, aceita requisições de vários clientes
- Navegador Web
- Servidor Web

### Benefícios do Uso

- Capacidade de resposta
	- Navegador Web
- Compartilhamento de Recurso
	- Mesmo espaço de endereço do processamento
	- Memória, recursos do processo que pertence
- Economia
	- Troca de contexto de threads)alocação de memóriae recursos) x processos
- Aplicações multiprocessador
	- paralelismo


### Threads de Usuário

- Implementados Através da biblioteca ligada ao programa do usuário (treads de usuário ou do nível do usuário)
- Visíveis ao programador e desconhecidos do Kernel
- Gerenciamento (criação escalonamento) através de biblioteca de threads
	- Pthreads
	- C-threads
	- threads
- Gerenciamento mais rápudo (Kernel não envolvido)


### Threads de Kernel

- SO suporta diretamente do conteito de threads
	- A gerência do SO é voltada ao conteito de threads
- Gerenciamento através do Kernel
- São escalonados para execuçao nos vários processadores
- Mais lentos
- Suportadas diretamente pelo SO

### Modelos Multithreading

- N:1 Muitos-para-Um
	- Gerenciamento de threads é feito no espaço do usuário (aplicação)
	- São implementadas no espaço do usuário (uso de biblioteca ligada ao programa)
		- API para uso de threads
	- Chavemento de contexto mais rpápido
	- Menor custo para criação/destruição
	- SO divide o tempo entre processos
	- A troca de contexto entre threds é feita no modo usário dpelo escalonador embutido na biblioteca

- 1:1 Um-para-Um
	- Maior concorrência
	- Threads a nivel do sistema
	- Maior custo de gerenciamento
		- exigem chamadas de gerenciamneto
		- troca de conteto exige a intervenção do SO
	- É possível a execução paralela (ambiente multiprocessado)
	- Permite sobrepor operações de um processamento com I/O
	- Desempenho da aplicação

- N:M Muitos-para-Muitos
	- Combina os modelos N:1 e 1:1
 	- M threads do usuários
	- N threads do SO
	- multiplexa threads de usuários em um número menor ou igual de threads de kernel
	- escalonamento de 2 níveis
		 - nível de usuário
		 - nível de sistema
	- É possível criar tantos threads quanto forem necessários

### Vantagens multithreads

- ...........................

# Threads em Java

- Há duas formas para uso de threads
	- criar uma subclasse da classe Threads (herança) e reescrever o método run()
	- A classe Thread implementa a classe Runnable
- .....
   
### Classe Thread
- alguns métodos()	
	- Construtores
	- run()
	- start()
	- sleep()

### Estados de threads
	- join()
