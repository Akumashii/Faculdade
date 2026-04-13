# Arquitetura de Software

#### Oque é?:
- Como eu vou estruturar essas classes até eu conseguir fazer oque eu quero.
- A estrutura do sistema, seus componentes, suas interações e as decisões de projeto que definme seu funcionamento.
- Sommerville enfatiza uma organização de componentes com responsabilidades externas

Arquitetura = "como o sistema é organizado por dentro"

Segundo Pressman:
- Facilita comunicação entre equipe -> padronização do projeto
- Define decisões críticas desde o ínicio -> nasce logo após os requisitos
- Reduz riscos do projeto 
- Serve como modelo do sistema

Trabalhar utilizando padrão está muito vinculada a qualidade do produto

Segundo Sommerville impacta diretamente:
- Desempenho
- Segurança
- Disponibilidade
- Manutenção

Não haverá nenhuma classe muito extensa.

#### Quando ela aparece?
- A arquitetura surge logo após os requisitos:
	- Requisitos → Arquitetura → Projeto detalhado → Implementação
- Importante:
	- Arquitetura não é código
	- É uma abstração de alto nível 

#### Decisões Arquiteturais

1) Existe uma arquitetura de aplicação genérica que possa agir como um template para o sistema que está endo projetado?
2) Como o sistema será distribuído entre os núcleos ou processadores do hardware?
3) Quais padrões ou estilos de arquitetura poderiam ser utilizados?
4) Qual será a abordagem fundamental utilizada para estruturar o sistema?
5) Qual estratéfia será utilizada para controlar a roperação dos componentes no sistema?
6) Como os componentes estruturais no sistema serão decompostos em subcomponentes?
7) Qual é a melhor organização da arquitetura para entregar.......................
8) .........................a 

#### Visões de Arquitetura

tipos de visões:
- **Visão Lógica**
	- Funcionalidades
	- ....
- **Visão de Processo**
 	- Execução e concorrência
	- Mostra como, no tempo de execução o sistema é comporto de processos que interagem. Essa visão é útil para fazer julgamentos sobre características não funcionais do sistema, como o desempenho e a disponibilidade.
- **Visão de Desenvolvimento**
	- Organização do código
	- .....
- **Visão Física**
	- Infraestrutura/hardware
	- .....

## Arquitetura em Camadas

**Oque são?**
- um padrão geral de organização do sistema

Organiza o sistema em camadas, com funcionalidade associada a cada uma. Uma camada fornece servições para a camada acima dela, então as camadas nos níveis mais inferiores representam os serviços essenciais que tendem a ser utilizados em todos o sistema

**Quando é utilizado?**
- Utilizado quando se cria novos recursos em uma de sistemas existentes. Quando o desenvolvimento é distribuido por vários times, cada um deles responsãvel por uma camada de funcionalidade; quando há necessidade de segurança da infromaçõ Security em múltiplos nível

**Vantagens:**
- Permite a subistituição de camadas inteiras ,.............

**Desvantagens:**
- Na prática, muitas vezes é dificil proporcionar uma separação clara entre as camadas, de modo que camadas dos níveis mais altos podem ter de interagir diratamente com as dos níveis mais baixos em vez das imediatamente inferiores a elas. O desempenho pode ser um problema por causa dos múltiplos níveis de interpretação de uma requisição de serviço à medida que essa requisição é processada em cada camada.

**Camadas:**
- Apoio ao sistema (sistema operacional, banco de dados, etc.)
	- Lógica principal do negócio/funcionalidade de aplicação; Componentes utilitários para o sistema
		- Gerenciamento de interface com o usuário; Autenticação e autorização
			- Interface com o usuário

**Camadas:**
- Camada central
	- Camada de utilitários
		- Camada de aplicação
			- Camda da interface do usuário

## Arquitetura de repositório/ centralizada em dados

Armazenamento de dados(repositório ou quadro-negro)
- └> Software cliente
- └> Software cliente
- └> Software cliente

Todos os dados em um sistema são gerenciados em um repositório central que é acessível a todos os componentes do sistema. O componentes não interagem diretamente, apenas por meio do repositório central.

**Quando é utilizado?:**
- Esse padrão deve ser usado em um sistema no qual............

**Vantagens:**
-  Os componentes podem ser independentes; eles não precisam saber da existência dos outros componentes. As mudanças feitas por um componente podem ser propagadas...........

**Desvantagens:**
- O repositório é um único ponto de falha, então os prblemas no repositório afetam o sistema inteiro. Pode haver ineficiências em organizar a toda comunicação por meio do repositõrio. Pode ser dificil distribuir o repositório por vários computadores.

### Arquitetura Cliente-Servidor

Clientes conectados à internet; Internet conectada nos servidores - diferentes itens em servidores diferentes, cliente acessa um tipo específico de conteúdo em um servidor específico, assim evita acessar todo o servidor para ver uma fração dos dados; 

Um sistema que segue padrão cliente-servidor é organizado como um conjunto de servições e servidores associados e de clientes que acessam e usam esses serviços. Os principais componentes desse modelo são:
1) Um conjunto de servidores que oferecem serviço para outros componentes.
2) Um conjunto de clientes que demanda os serviços oferecidos pelos servidores.
3) Uma rede que permite que os clientes acessem esses serviços.

Em uma arquitetura cliente-servidor...........................

Quando é utilizado:
- Utilizado quando os dados em um banco...........................

Vantagem:
- A principal vantagem desse modelo é que os servidores podem ser distribuídos pela rede.........................

Desvantagens:
- Cada serviço é um único ponto de falha e, portanto, é suscetível a ataques de negação de serviço ou a falhas no servidor. O desempenho pode ser imprevisível porque depende da rede e também do sistema. Podem surgir problemas de gerenciamento se os servidoes forem de propriedade de organização diferentes.

## Arquitetura duto e filtro

[IMAGEM_AAAAAAA1]
[IMAGEM_AAAAAAA2]

O processamento dos dados em um sistema é organizado de modo que cada componente de processamento (filtro) é discreto e executa um tipo de de transformação dos dados. Os dados fluem (como em um duto) de um componente para outro para serem processados.

**Quando é utilizado?**
- ...............

**Vantagens:**
- ............

**Desvantagens:**
- .,.,............,

## MVC - Modelo, Visão, Controlador

Separa a apresentação e a interação dos dados do sistema. O sistema é estruturado em três componentes lógicos que interagem entre si.
- O componente **Modelo** gerencia os dados do sistema e as operações a eles associadas
- O componente **Visão** define e gerencia como os dados são apresentados ao usuários
- O Componente **Controlador** ..............

**Quando é utilizado?**
- ...............

**Vantagens:**
- Permite que os dados sejam alterados independentemente................

**Desvantagens:**
- Pode envolver mais código e aumentar sua complexidade quando o modelo de dados e as interações forem simples

[IMAGEM_AAAAAAA3]

## MVT - Modelo, Visão, Template

# Arquiteturas de Aplicações

Arquiteturas de aplicações são modelos genéricos reutilizáveis que descrevem a estrutura de sistemas dentro de um domínio específico

São "modelos prontos" que podem ser adaptados para desenvolver sistemas semelhantes.

Os sistemas de processamento de .......................

### Sistemas de processamento de transações
### Sistemas de informação
### Sistemas de processamento de Linguagem

