# Memória Virtual 
parte da memória secundária (disco rígido) é usada como extensão da memória principal (RAM).

podemos chegar ao limite de memória principal

Conceitos iniciais:
- mecanismos básico de paginação
- page fault
- paginação por demanda
- substituição de paginas
- buffer de paginas
- ...
- ...

Memória virtual permite executação de programas que não são carregados totalmente na memória física: para funções raramente usadas, rotinas de tratamento de exceções ou acesso a arquivos, programas que para execução exigem maior espaço de memória. Paginação quanto a Segmentação podem ser estendidas para uso de memória virtual.

# Mecanismo de Páginação

Tabela de páginas,
- bit de validação de cada página
- V = página válida = carregada na memória
- I = página inválida = não carregada na memória ou erro na paginação 

Quando ocorre um acesso à memória -> busca tabela de páginas
- bit V
- bit I

# Page Fault

Quando ocorre a Falta de Página o SO executa o seguinte fluxo:
- suspende o processo e seu PCB vai para a "fila de processos esperando por página lógica"
- ......

# Paginação por Demanda

...

# Substituição de Páginas na Memória

ao ocorrer page fault há necessidade de uma págia livre na memória física. recapitulando, na tabelação de página quando ocorre inválido por falta de espaço na memória física.  
assim precisamos de uma vítima para interromper e dar espaço àqueles inválidos, SO que escolhe algum espaço para liberar -> MMU controla isso


bits auxiliares são adicionados à tabela para auxiliar a substituição..
- Bit de sujeira
- Bit de referência
- Bit de tranca

Algoritmos de substituição de página
---

Algoritmo Ótimo
---

coloca a falta de pagina em um futuro mais longe, menor taxa de falta de páginas. Conhecido como OPT ou MIN, consistem em substituir a página que não serpa usada pelo período mais longo, assim, é necessário conhecer as próximas referências às páginas e é difícil de implementar

FIFO (First In First Out) ou FCFS
---

a pagina escolhida é a que está há mais tempo na memória  
a MMU deve ter uma lista com os numeros da páginas lógicas, quando uma página é carregada na memória seu número é colocado no final da lista. Desempenho ruim -> não considera se a página já foi visitada

LRU (Least Recently Used)
---

aproximação do algoritmo ótimo -> escolhe a página que há mais tempo não é usada(acessada), assim, considera que páginas acessadas recentemente por um processo serão novamente acessadas por ele em breve. Exige suporte de hardware c/ registrados adicionais ent tem um algot custo para manter a tabela de páginas atualizada



# Buffer de Páginas

Usado em conjunto com algoritmo de substituição de páginas, pode ser usado mesmo quando o MMU não implementa o bit de referência. Há um apontador que precorre a lista circular de páginas...

Página indicada pelo apontador é marcada como inválida................................................................................................

# Alocação de Quadros ( Frame Alocation)

Quadros = páginas físicas

problema:
- quantas paginas logicas de cada processo devem fincar na memoria fisica......
- ......

Algoritmo Alocação de Quadro:
- m -> número de quadros
- p -> processos

Alocação é proporcional ...........

formas de alocação
- alocação local
- alocação global

# Thrashing

o tratamento falta de página é mais lento que o acesso normalà memória

ocorre thrashing quando a maior parte do seu tempo é usada paar paginação ao invés de execução

consequencia do thrashing é a queda global do desempenho do sistema, quando reinicia o SO tudo se resolve. Para o usuário se apresenta:
- congelamento do sistema: tanto local tanto global

                                
