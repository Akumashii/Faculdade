# Índice

Em banco de dados são estruturas que otimizam o acesso e recuperaçãi de dados em tabelas, de forma similar ao índice de um livro que facilita encontrar um tópico específico

Utilizar índice é necessário muito armazenamento, todavia a velocidade de consulta acelara bastante, assim é uma balança entre espaço e velocidade onde são inversamente proporcionais
### Utilidade

- melhorar a performance de consultas (principalmente SELECT)
- Acelerar operações de busca como WHERE, JOIN, ORDER BY, GROUP BY

### Quando não usar?

- em tabelas com poucas linhas
- quando as operações de gravação (INSERT, UPDATE e DELETE) são muito frequentes e exigem alta performance

## Tipo de Índice

- Índice Clusterizado
- Índice não Clusterizado
