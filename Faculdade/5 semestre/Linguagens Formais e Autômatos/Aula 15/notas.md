# Simplificação de Gramáticas Livre do Contexto

## Exclusão das Produções Vazias


Produções na forma $A → \varepsilon$  


### Etapa 1

Identificar variáveis que constituem produções vazias


### Etapa 2

identificar as variáveis que não constituem produções vazias.  
naquelas identificadas na etapa 1, substituí-las pela produção não vazia


### Etapa 3

Se $a \space \varepsilon$ pertence à linguagem, é incluída uma produção específica para tal fim

---

## Exclusão de Produções A → B

Produções que produzem apenas uma variável, apenas substituem uma variável pela outra, podem ser otimizadas  
- Se $A → B \space e \space B → \alpha$
- Então, $A → B$ pode ser substituído por $A → \alpha$


### Etapa 1: fecho transitivo de cada variável

Conjunto de variáveis de cada que podem substituí-las transistivamente
- exemplo: Se $A → B \space e \space B → C$, então B e C pertencem ao FECHO-A 


### Etapa 2: exclusão das produções que substituem variáveis

se $\alpha$ é atingível a partir de A, por meio de FECHO-A, substituir produção

---

## Exclusão de Símbolos Inúteis


Símbolos inúteis são símbolos **não usados** na geração de palavras de terminais.  
Esta etapa exclui:
- produções que fazem referência aos símbolos inúteis;
- os próprios símbolos inúteis;
- não é necessária qualquer modificação adicional
