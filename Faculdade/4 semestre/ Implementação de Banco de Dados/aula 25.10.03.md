# Transações

estamos trabalhando com Banco de Dados ATIVOS, o banco "faz algo" para nós conforme a programação

agora, TODO banco de dados relacional OBRIGATORIAMENTE respeita as características ACID:
- Atomicidade
- Consistência
- Isolamento
- Durabilidade

em si, uma transação em banco de dados é um conjunto de operações que são tratada como única unidade de trabalho

um exemplo, transação monetária de tranferência de dinheiro
em si são 2 UPDATES mas não é considerado como duas transações, é apenas uma.

uma transação deve ser COMPLETAMENTE CONCLUÍDA ou COMPLETAMENTE REVERTIDA
para garantir que o banco de dados permaneça em um estado consistente

o principal objetivo de uma transação é garantir a integridade e consistência dos dados, mesmo diante de fahlas
como erros de sistema ou interrupções inesperadas

### ACID
#### Atomicidade

A atomicidade garante que uma transação é tratada como uma única
unidade, o que significa que ela deve ser completamente concluída
ou totalmente desfeita. Se qualquer parte da transação falhar, todo
o resto também falha

#### Consistência

A consistência garante que uma transação leve o banco de dados de
um estado válido para outro estado válido, respeitando todas as
regras definidas, como chaves primárias, integridade referencial, etc.

#### Isolamento

O isolamento garante que as transações sejam executadas de forma isolada,
sem que as operações de uma transação afetem as operações de outra.
O nível de isolamento pode variar, afetando a visibilidade das mudanças feitas por transações concorrentes

#### Durabilidade

O Banco, normalmente, não guarda estados anteriores, apenas há a versão atual.
Uma vez que a transação é confirmada não há volta.
Então, a durabilidade garante que, uma vez que uma transação é confirmada (committed),
ela permanecerá no banco de dados, mesmo que ocorra uma falha no sistema.
Os dados serão PERSISTIDOS no armazenamento.

### Comando TRANSACTION 

BEGIN TRANSACTION: Inicia uma nova transação
COMMIT TRANSACTION: Confirma a transação, aplicando permanentemente todas as operações feitas no banco
ROLLBACK TRANSACTION: Desfaz todas as operações realizadas desde o início da transação
SAVEPOINT: Define um ponto dentro de uma transação para permitir um rollback parcial até o ponto


BEGIN TRANSACTION;
"bloco"
IF @@ERROR<>0 --diferente de zero
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;

obs: @@ERROR é para o erro do ultimo comando dado
ele é ótimo para fazer update, inserts....

