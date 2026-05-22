# 

ENTRADA
- ALMOX
- ENVIROMENT


Almoxarifado 
- simula a entrada de peças: pequena, média, grande
- verbalizando a retirada da peça
- verbalizando a comunicação dos agentes

Robos:
- robo1: junta peças pequenas
- robo2: junta peças médias

---

três arquivos:
- mas2j. -> projeto
- .asl -> cabeça do agente, crença e planos
- .java -> simulação, adicionar e remover a percepção ao ambiente, executar ação 

1) instalar jason (https://jason-lang.github.io/)
2) editar variaveis de ambiente com o caminho do bin
3) abrir o visualcode, entrar no terminal gitbash e verificar versão jason → $jason --version
4) criar espaço para trabalho → $jason app create almoxarifado
5) entrar na pasta criada



---

1) ambiente deve produzir peças (.java)
  - ambiente apenas adicionará peça

---

agente robo1:
```

viagens(5).
guarda(peq).

!start.

+!start : true
	<-
		?guarda(Peca); //guardo essa peça que recebi? se é pequena sim! todo resto não xoxo
		?viagens(Qtd); //tenho viagens restantes para guardar? 
		.print("estou ativo e posso guardar peças ", Peca," e tenho ", Qtd, " viagens possíveis").

//aqui muda a crenca decrementando a quantidade de viagens (Qtd - 1) que ele pode fazer ao realizar uma viagem
+peca(Peca) : guarda(Peca) & viagens(Qtd) $ Qtd > 0
	<-
		.print("percebi uma peça ", Peca, " na entrada e vou guardá-la");
		-viagens(Qtd);
		.NovoQtd is Qtd - 1;
		+viagens(NovoQtd).

//age como if else, a leitura dos planos é sequencial, assim o plano acima é executado primeiro e se viagens for igual a zero ele não executa
//entrando dentro da condição abaixo, tal qual a execução de um if else, mas não é if else!
//então entra na execução deste plano, entra com a condição de peca apenas para notifcar que não pode guardá-la já que não entrou no plano anterior(acima)
+peca(Peca) : guarda(Peca)
	<-
		.print("percebi uma peça ", Peca, " mas não tenho como guardá-la").

```
