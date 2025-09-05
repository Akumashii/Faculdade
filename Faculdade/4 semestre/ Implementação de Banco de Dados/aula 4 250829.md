# Observações

para começar a construir um select alinhado começe no select mais interno, de dentro para fora


# Váriaveis

As variáveis podem ser declaradas no corpo de um batch ou procedimento.
Pode-se atribuir-lhes valores usando-se declarações SET ou SELECT.
As variáveis são inicializadas por padrão com NULL

## Declaração de valores

DECLARE @nome_var tipo

Exemplo:
  DECLARE @valor INT,
  @texto VARCHAR(40),
  @data_nasc DATE,
  @nada MONEY
  
  Obs. Usa-se a palavra DECLARE apenas uma vez para todas as variáveis.

## Atribuição de valores 

### com SET

SET nome_var = valor_var

Exemplo:
  SET @nome = 'Marcille'

### com SELECT

SELECT nome_var = coluna FROM tabela
WHERE condição
SELECT nome_var AS alias
  
## Consulta de valor

SELECT nome_var AS aliases

Exemplo: 
  SELECT @valor AS Valor, @texto AS Texto,
  @data_nasc AS ‘Data de Nascimento’,
  @nada AS Salário

# Conversão de Dados

## CAST

CAST (expressão AS novo_tipo_dados)

Usando CAST para converter o salário decimal em uma string: 

PRINT @funcionario + ', salario = ' +CAST(@salario AS VARCHAR) -- @salario passa a ser um VARCHAR, assim podendo ser printado

## CONVERT

usado igual o CAST mas com brilhinho a mais, o estilo.

CONVERT (novo_tipo_dados, expressão, estilo)

*estilo é OPCIONAL, usado normalmente para converter DATE ou FLOAT/real

CONVERT, converter data de nascimento para o padrão brasileiro: dd/mm/aaaa (103)

@data_nasc_br = CONVERT(VARCHAR(10), F.Datanasc, 103)


# IF / ELSE

IF e ELSE são parecidos como se programa em C, todavia têm suas particuliaridades

IF condição
  BEGIN
    Bloco de código
  END;
// não temos abre e fecha chaves, ao invés disso é BEGIN e END

IF condição
  Linha de código // não precisa de BEGIN e END quando é uma linha só
ELSE
  BEGIN
    Bloco de código
  END;











