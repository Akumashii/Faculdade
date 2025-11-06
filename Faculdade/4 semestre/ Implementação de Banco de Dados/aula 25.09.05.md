# FUNCOES

as funções no SQL Server permitem encapsular lógicas de procesamento que podemm ser returilizadas em consultas. 

Diferente das Stored Procedures, elas retornam obrigatoriamente um valor (escalar ou tabela) e podem ser usadas diretamente em instruções SELECT, WHERE, etc.

elas precisam ser separadas do lote principal

<img width="750" height="372" alt="{F81CAD2E-C65C-4AE5-AFB0-3CA12A19E453}" src="https://github.com/user-attachments/assets/1be4b5cf-b979-4ad1-bd07-ad32c9734a9d" />



## FUNCAO ESCALAR

boas práticas, adicionar fn_ para representar função

as funções criadas ficam armazenadas (pelo menos no SQL Server) em:
Banco de Dados/EMPRESA/Programação/Funções

```SQL
CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT
AS
BEGIN
  RETURN @Numero * 2;
END;
```

```SQL
-- Como usar
Diretamente no SELECT
SELECT dbo.fn_Dobro(5) AS Resultado;
-- Em conjunto com uma tabela de exemplo
SELECT Pnome, Unome, Salario, dbo.fn_Dobro(Salario) AS Salario_Dobrado
FROM FUNCIONARIO;
```

## Função InLine(Retornando Tabela

retornam uma tabela como resultado de uma query(consulta)

```SQL
CREATE FUNCTION fn_Nome(@parametro TIPO)
RETURNS TABLE
AS
RETURN
(
    SELECT colunas
    FROM tabelas
    WHERE condições
);
```

## Função Multi-Statement(Tabela com lógica)

```SQL
CREATE FUNCTION fn_Nome(@parametro TIPO)
RETURNS @Tabela TABLE
(
   atributo TIPO,
   atributo TIPO,
   atributo TIPO
)
AS
BEGIN
    INSERT INTO @Tabela
    SELECT colunas
    FROM tabelas
    WHERE condições;
    RETURN;
END;
```

