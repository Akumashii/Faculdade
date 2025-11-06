### Comando CASE

``` sql
/* CASE
classificar funcionarios por faixa salarial usando CASE
até 20k - baixo
entre 20k-40k - médio
acima de 40k - alto
*/

SELECT 
	Pnome AS 'Nome',
	Unome AS 'Sobrenome',
	Salario,
	CASE
		WHEN Salario <= 20000 THEN 'Baixo'
		WHEN Salario BETWEEN 20000 AND 40000 THEN 'Médio'
		WHEN Salario > 40000 THEN 'Alto'
		ELSE 'Sem Registro'
	END AS 'Categoria'
FROM FUNCIONARIO;
```

### Retomando TRANSAÇÕES

- ACID
  - Atomicidade*
    - indivisivel  
  - Consistência
    - meu banco SEMPRE sai de um estado VÁLIDO para outro estado VÁLIDO
  - Isolamento
    - operações executadas passo a passo, 1 por vez e cada um tem sua vez (maneira simplista)
  - Durabilidade
    - COMMIT, uma vez salvo lá dentro está SALVO na HD
    - sem possibilidade de ctrl+z, voltando apenas por BACKUP 

### TRY CACTH SQL
semelhante a função do try catch que conhecemos 

comum dentro de transações usar o try catch 

``` sql
BEGIN TRY
	SELECT 1/0; --ERRO
	PRINT 'Não cheguei aqui'
END TRY
BEGIN CATCH
	PRINT 'DEU ERRO@!!';
	PRINT 'Número: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
END CATCH
```

# Exercícios

 
