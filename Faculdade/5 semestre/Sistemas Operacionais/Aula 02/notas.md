# SO

Análise de um Sistema Operacional:
- Serviços fornecidos
- Interface fornecida a usuários e programadores
- Componentes e interconexões

nem todos os sistemas possuem a mesma estrutura mas existem alguns aspectos comuns aos quais dão suporte

### Componentes

1) Kernel (núcleo)
2) Gerência de Processador
3) Gerência de Memória
4) Gerência de I/O
5) Gerência de Arquivos
6) Interface gráfica com o usuário
7) Comunicação

### Mecanismo de Interrupções

Quando há sinalização do Hardware → SO chama-se Interrupção, quando há sinalização do Aplicativo → SO chama-se System Call

Execução de Interrupção (ponto chave para multiprogramação):
- transfere o controle para o tratador (salva o contexto de execução)
- desvia controle para o tratador
- retorna execução (restaura contexto de execução

Chamada de Sistema:
- Processo usuário solicita serviços ao SO, interrupção de software (traps)

### Proteção

O sistema operacional deve garantir a correta utilização dos
recursos computacionais e propiciar a execução das aplicações no
computador. Para isto, é necessário mecanismos de proteção para que as
aplicações não consigam acessar o hardware diretamente e sim,
que isto seja mediado pelo sistema operacional

- Proteção de Memória
- Proteção de CPU

#### Modo Dual de Operação 
Há diferentes modos de execução (privilégios), que constituem o Modo Dual de Operação
-	modo Supervisor, Monitor, Kernel;
	-	Todas as instruções do processador podem ser executadas (instruções privilegiadas)
	-	Execução de todas as instruções do processador
-	modo Usuário;
	-	Execução dos processos usuários
	-	Somente um subconjunto de instruções do processador, registradores e portas E/S estão disponíveis
	-	Caso o cógido em execução tentar executar uma instrução não dispon~ivel, será gerada uma exceção

Chaveamento de modos
- Interrupção (modo usuário → modo supervisor)
- Instrução (modo supervisor → modo usuário)

---

# Estrutura do Sistema

Sistema operacional deve ser dividido em pequenos componentes enão ser um sistema monolítico

### Principais Componentes

- Núcleo
- Drivers
	- Códigos específicos para acessar os dispositivos físicos	
- Códigos de Inicialização
	- reconhecer, testar e configurar os dispositivos instalados
  - carregar o núcleo do SO e iniciar a execução
- Programas Utilitários
 - funcionalidades complementares do SO

### Kernel do SO

É a parte do SO executada com interrupções desabilitadas e no modo privilegiado, nos trechos críticos não há interrupção

O Kernel pode ser monolítico
- quando todos os componentes do SO são executados com interrupções desabilitadas e no modo priveligiado
- Toda e qualquer parte no SO é executada de maneira indívisivel
	- Cada trap (chamada ao sistema) ou interrupção desabilita o sistema de interrupções

# Estrutura do Sistema

Como os componentes são combinados e interconectados
- Estrutura simples
- Camadas
- Microkernels
- Módulos
- 
### Estrutura Simples

### Estrutura do Unix

[imagem_Unix] 

### Camadas

Forma de modularização de um sistema

Menos eficientes devido à hierarquia de camadas; Pemite controle maior do hardware, em relação à abordagem simples

A primeira camada pode ser depurada sem preocupação com o resto do sistema, porque utiliza somente o hardware básico para implementar suas funções

Dificuldade: definição adequada das camadas

Tendem a ser menos eficientes que outros tipos → em cada camada, os parâmetros podem ser modificados, os dados precisam ser transferidos... custos são acrescentados → maior tempo na chamada ao sistema

[imagem_Camadas]

### Microkernel 

Expansão do Unix, o kernel tornou-se grande e difícil de gerenciar

Abordagem do Microkernel em 1980 pelo Sistema Operacional Mach, implementa somente os componentes essenciais do SO no kernel e demais são implementados como programas de sistema e de usuário
- retirou-se do kernel o código de alto nível
- Os componentes do SO comunicam-se por meio de trocas de
mensagens
- Kernel menor
- Facilidade de manutenção

.
.
.

[imagem_Microkernel]

### Módulo

.
.
.

### Máquina Virtual

.
.
.

### Considerações Finais

As abordagens não são mutuamente exclusivas
- camadas
- microkernel
- módulos
- máquina virtual
