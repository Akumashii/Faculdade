# Chamada ao Sistema (System Call)

As Chamadas ao Sistema fornecem a interface entre uma aplicação e o sistema operacional para acesso ao hardware

System Calls:
- Instruções em assembly
- Podem ser escritas em uma linguagem de nível mais alto como C ou C++
- Acessada pelos programas de alto nível por meio da API
- Programa de alto nível -> pode gerar outras chamadas
- In-line

É necessário o mecanismo de interrupções

API disponíveis aos compiladores pelos Sistemas Operacionais, por exemplo a API para manipulação de arquivos em C:
1) Criar o novo arquivo copia.txt (abrir - criando - em modo de escrita)
2) Abrir o arquivo original.txt em modo leitura
3) Ler 1 linha no arquivo original.txt
4) Gravar 1 linha no arquivo copia.txt
5) Repetir passos 3º e 4º enquando não for o fim do arquivo
6) Fechar o arquivo orginal.txt
7) Fechar o arquivo copia.txt

Maioria das linguagens oferece interface mais simples, pois, detalhes da interface do sistema operacional são ocultos ao programador através do compilador e do pacote de suporte ao programador através do compilador e do pacote de suporte à execução, **não é necessário conhecer como a system call é implementada**

3 métodos para passado os parâmetros às chamadas:
1) Registradores (mais simples)
2) Bloco ou tabela na memória e o endereço do bloco é passado ao registrador (não limita a quantidade de parâmetros)
3) Inseridos (push) na pilha do sistema pelo programa e lidos/removidos (pop) pelo SO (não limita a quantidade de parâmetros)

Categorias de System Call:
- Controle de processo
- Gerência de arquivos
- Gerência de dispositivos
- Manutenção de informações
- Comunicação

# Processos

Processo é um conceito utilizado em sistemas operacionais para identificar um
elemento que concorre à execução. “Um mesmo programa pode estar sendo executado por vários usuários, ao mesmo tempo, mas para cada usuário existe um processo”

Cada processo é uma estrutura de dados, sistemas operacionais são baseados em filas e cada elemento é um processo.

Cada processo trabalho sobre uma área de memória privativa

### Multiprogramação

Muitos programas carregados na memória execuados de forma concorrente, processos que executam concorremente, selecionados pela CPU a fim de tornar o computador mais produtivo.

Mecanismos de Interrupções, ela possuem um tipo (0..255) definido pelos projetistas do sistema, há uma relação de prioridade entre interrupções. Há momentos que não podem ocorrer interrupções (habilitar/desabilitar interrupções), evitar acesso a valores incorretos.
- Controlador de Periférico: conecta o periférico ao processador, traduz sinais ao dispositivo.
- Processador: ler, escrever dados, ler status do dispositivo, reiniciar, escrever comandos
- Diagrama de Tempo de uma Operação E/S: [imagem]

### Diagrama de Estados de um Processo

Apenas um processo executa em qualquer processador a cada instante, muitos processos podem estar prontos ou em espera (fila de prontos/fila do processador). E conforme um processo é executado ele muda de estado.

Estados de um processo:
- Novo (new)
- Em execução (running)
- Em espera (waiting)
- Pronto (Ready)
- Encerrado (Terminated)

[IMAGEM_DIAGRAMA_ESTADOS_PROCESSO]

Alguns estados podem assumir mais de um processo:
- Novo -> fila de novos
- Pronto -> fila de prontos
- Em espera -> fila dos dispositivos

Quando um processo está em execução e sofre interrupção é chamada de **troca de contexto**.


