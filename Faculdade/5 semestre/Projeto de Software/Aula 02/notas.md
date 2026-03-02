# Modelagem de Sistema - Projeto

Ajuda a compreender a complexidade do que estou fazendo, que aumenta à medida que o sistema cresce. E para construção de sistemas de software mais complexos é necessário um planejamento inicial, um desenvolvimento de um modelo.

A representação de um diagrama entidade-relacionamento é um modelo na construção de sistemas, razões para se utilizar modelos:
- **Gerenciamento da complexidade**, há limitações no que o ser humano consegue lidar com a complexidade, pode haver diversos modelos de um mesmo sistema, cada qual descrevendo uma perspectiva do sistema a ser construído 
- **Comunicação entre pressoas envolvidas**, desenvolvimento de um sistma envolve a execução de uma enorme quatidade de atividades, grande parte dessas informações corresponde aos
modelos criados para representar o sistema
- **Redução dos custos no desenvolvimento**, seres humanos estão sujeitos a cometer erros tanto individuais tanto em grupo
- **Previsão de Comportamento do Sistema**, comportamento do sistema por ser discutido mediante análise dos seus modelos. Os modelos servem como um "laboratório" que diferentes soluções podem ser experimentadas para um problema

# Paradigma de Programação - Orientada a Objetos

Paradigmas são úteis conforme sua necessidade e contexto, aqui nessa disciplina buscamos paradigmas para construção de sistemas

A orientação objeto pode ser compreendida pela "analogia biológica", um sistema de software que funcionasse como um ser vivo, nesse sistema, cada "célula" interagiria com outros células através do envio de mensagens com o objetivo realizar um objetivo comum. Além disso cada célula se comportaria como uma unidade autônoma. 

De forma geral é construir agentes autônomos que interagem enrte si. Esta raciocínio segue os seguintes princípios da orientação a objetos:
- Qualquer coisa é um objeto.
- Objetos realizam tarefas por meio da requisição de serviços a outros objetos.
- Cada objeto pertence a uma determinada classe. Uma classe agrupa objetos similares.
- A classe é um repositório para comportamento associado ao objeto.
- Classes são organizadas em hierarquias

Por exemplo, NÃO é função da função "main" armazenar diversos métodos, é questão de organização.
Normalmente ela apenas inicializa o sistema.

Um objeto acessa outro por meio de métodos, é pela interação entre objetos que uma tarefa computacional é realizada.

Então, um sistema de software orientado a objetos consiste em objetos em
colaboração com o objetivo de realizar as funcionalidades desse sistema.
Cada objeto é responsável por tarefas específicas. É graças à cooperação
entre objetos que a computação do sistema se desenvolve.

### Classe e Objeto

[IMAGEM_CLASSE_E_OBJETO]

### Operação Mensagem e Estado

**Operação**, é uma ação que o objeto sabe executar quando chamado

**Mensagem**, na terminologia de orientação a objetos que objetos de um
sistema estão trocando mensagens significa que esses objetos estão
enviando mensagens uns aos outros com o objetivo de realizar alguma
tarefa dentro do sistema no qual eles estão inseridos.

**Estado**, corresponde ao conjunto de valores seus atributos em um ado momento. Uma mensagem enviada a um objeto tem o potencial de mudar o estado desse objeto

### Abstração na Orientação a Objetos

Abstração é o processo mental, nos atemos aos aspectos mais importante e relevante de alguma coisa, ao mesmo tempo em que ignoramos os menos importantes

Para ser considerada Orientação a Objetos **OBRIGATORIAMENTE** deve conter 4 aspectos:
- Encapsulamento
  - Nível de privacidade de um comportamento interno de um objeto afim de restringer o acesso.
- Polimorfismo
  - É o princípio pelo qual duas ou mais classes derivadas da mesma superclasse podem invocar métodos que têm a mesma assinatura, mas comportamentos distintos
- Generalização (Herança)
  - Sentido de leitura, quanto mais alto mais abstrato e mais geral
  - Declara que as características e o comportamento comuns a um conjunto de objetos podem ou não ser abstraídos em uma classe
- Composição
  - Um objeto pode ter como atributo outro objeto
  - "Objetos compostos por outros Objetos"
 
# UML e Visões de um Sistema

Para representar sistemas, os grupos de simbolos para representar, usamos UML. Nessa Disciplina usamos 3 diagramas básicos interconectados

### Visão de Caso de Uso

A visão de como o usuário usaria aquele sistema, descreve o sistema de um ponto de vista externo como um conjunto de interações entre o sistema e os agentes externos ao sistema. Esta visão é criada em um estáfio inicial e direciona o desenvolvimento das outras visões do sistema

### Visão de Projeto

Enfatiza as características do sistema que dão suporte, tanto estrutural quanto comportamnetal, às funcionalidades externamente visíveis do sistema

### Visão de Implementação

Diagramas de módulos e componentes, como os pedaçõs do sistema de conectam

### Visão de Implantação

Fazer o sistema rodar,

### Visão de Processo

Enfatiza as características de concorrência (paralelismo), sincronização e desempenho

### Diagramas UML

[IMAGEM_DIAGRAMAS]

Os diagramas notáveis:
- **Diagrama de Classes**, o principal, mais necessário e considerado **obrigatório**
- **Diagrama de Casos de Uso**, depende da metodologia
- **Diagrama de Sequência**
- **Diagrama de Objetos**
- **Diagrama de Transições de Estados**
- **Diagrama de Atividades**

# Processo de desenvolvimento de software

## Atividades típicas de um processo de desenvolvimento

Um processo de desenvolvimento classifica em atividades as tarefas realizadas durante a construção de um sistema de software. Há várias processos de desenvolvimento e é um consenso na comunidade de desenvolvimento de software o fato de que não existe um melhor processo, aquele que melhor se aplica a todas as situações de desenvolvimento

Cada processo é particular em relação ao modo de arranjar e encadear as atividades de desenvolvimento. 

#### Levantamento de Requisito

Começamos os requisitas de um sistema identificando o **Domínio**. Denomina-se **domínio** a **área do conhecimento** ou atividade específica caracterizada por um conjunto de conceitos e de terminologia compreendidos por especialistas nessa área.
- Exemplo: Fazer um software para Petshop possui Domínio, ou área do conhecimento, da Veterinária

Tipos diferentes de requisitos:
- **Requisitos Funcionais**, é ação do sistema, sobre oque ele faz, exemplo: "o clique de um botão"
- **Requisitos Não-Funcionais**, tudo aquilo que não é ação, como, desempenho e estética
- **Requisitos Normativos**, Declaração de restrições impostas sobre o desenvolvimento do sistema. Por exemplo, aspectos legais(licenciamento), adequação a custos e prazos, componentes de hardware e software
- **Requisitos Regra de Negócio**, uma restrição que é aplicada como critérios de sucesso para um sistema. Descrevem condições, obrigações, permissões e restrições que devem ser consideradas em processos e operações. Exemplo: fazer a validação de um cadastro conforme critério de uma empresa

#### Análise - (comunicação & planejamento)

As fases de **Levantamento de Requisitos** e de **Análise de Requesitos** podem se agrupar em **Engenharia de Requisitos**

Esta é a etapa na qual os analistas realizam um estudo detalhado dos requisitos levantados na
atividade anterior. A partir desse estudo, são construídos modelos para representar o sistema a ser construído.

As principais ferramentas da UML para realizar análise são:
- **Diagrama de Caso de Uso**
- **Diagrama de Classes**

O foco principal da análise são os aspectos lógicos e independentes de implementação de um sistema

#### Projeto

Esta fase consiste em duas partes:
- Projeto da Arquitetura (projeto de alto nível)
- Projeto Detalhado (projeto de baixo nível)

**Projeto de Arquitetura**, consiste em distribuir as classes de objetos relacionadas do sistema em subsistemas e seus componentes. Consiste também em distribuir esses componentes fisicamente pelos recursos de hardware disponíveis
Diagrama Utilizado:
- **Diagrama de Implementação**

**Projeto Detalhado**, são modeladas as colaborações entre os objetos de cada módulo com o objetivo de realizar suas funcionalidades. Também são realizados o projeto da interface com o usuário e o projeto de banco de dados, bem como são considerados aspectos de concorrência e distribuição do sistema.
Diagrama Utilizado:
- **Diagrama de Classes**
- **Diagrama de Casos de Uso**
- **Diagrama de Interação**
- **Diagrama de Estados**
- **Diagrama de Atividades**

Embora a Análise e o Projeto sejam descritos separadamente neste, é importante notar que durante o desenvolvimento não há uma distinção assim tão clara entre essas duas fases, frequentemente se misturam principalmente aos Sistemas Orientados a Objetos

#### Implementação

Nessa fase o sistema é codificado, ocorre a tradução da descrição computacional obtida na fase de projeto em código executável

#### Teste

Teste unitário, são realizados sobre elementos do código-fonte do sistema. Programação do fluxo para validação de classes ou métodos.

Teste de Integração, realizado após os testes de unidades. O elemento de uma atividade de teste de integração pode ser uma operação de sistema

Teste Interface, teste de funcionalidade do sistema sem conexão 

#### Implantação

Resumidamente, colocar o sistema para rodar no servidor.

# Participantes do Processo

##### Gerente de Projeto
  -  orçamento do projeto
  -  estimativa de tempo
  -  organizar o ambiente
  -  definir os cronogramas
  -  gerenciar recursos de hardware e software

##### Analista
  - ajuda a identificar os problemas e modelagem do sistema

##### Projetista
  - avaliar alternativas de solução do problema

##### Arquitetos de Software
  - encontrado principalmente e grandes equipes reunidas para desenvolver sistemas complexos
  - trabalha em conjunto com o gerente de projeto para priorizar e organizar o plano do projeto
  - deve ser capaz de tomar decisões técnicas detalhadas
  - o objetivo desse profissional é elaborar a arquitetura do sistema como um todo
  
##### Programadores
  - responsáveis pela implementação do sistema
  - comum ver analistas programadores, analistas que programam ou programadores que análise

##### Especialista de Domínio
  - 

##### Avaliadores de Qualidade
  - 
