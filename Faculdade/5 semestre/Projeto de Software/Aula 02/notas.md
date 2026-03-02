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
