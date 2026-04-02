# PROLOG

Amplamente utilizada no desenvolvimento de aplicações que envolvem inteligência artificial, processamento de linguagem natural e sistemas **Baseados em Conhecimento**.

É uma linguagem do paradima lógico = o programador implementa o que quer e quando quer.

Usa como motor de raciocínio o método de busca por PROFUNDIDADE (recursivo e de força bruta), baseado em sentenças ou predicados ou assertivas ou cláusulas. 

O mais comum é usar "PREDICADO" = relação entre os objetos da sentença.

Em PROLOG um argumento/parâmetro pode ser: OBJETO, LITERAL (conceito de literalmente), VARIÁVEL (1° letra = maiúscula).

A ferramenta PROLOG não tem nenhuma ferramenta para controle de restrição.
``` prolog
%fato no predicado jogador(nome, idade)
jogador('Alexandre',45).
jogador('Luiz Friess',19).
jogador('Victor',19).
jogador('Maria',55).

%fato no predicado homem(nome)
homem('Alexandre').
homem('Luiz Friess').
homem('Victor').

%regra no predicado mulher(nome)
% :- significa se somente se
mulher(M) :-
	jogador(M,_),
	not(homem(M)).
% verifica se M é um jogador
% verifica se M não é homem(M)

%predicado joga(nome, tipo)
joga('Alexandre','RPG').
joga('Luiz Friess', 'FPS').
joga('Victor','FPS').
joga('Victor','MMO').
joga('Maria','MMO').
joga('Maria','RPG').

%fato no predicado jogo(nomeJogo, tipo, IdadeIndicativa)
jogo('The Witcher 3', 'RPG', 18).
jogo('Bioshock', 'FPS', 16).
jogo('WOW','MMO',0).

%regra no predicadorecomenda RPG 
recomendaRPG(Pessoa,Jogo) :-
	jogador(Pessoa, IdadeJogador),
	joga(Pessoa,'RPG'),
	jogo(Jogo,'RPG',IdadeCensura),
    IdadeJogador >= IdadeCensura.
% verifica se Pessoa é um jogador
% verifica se Pessoa joga 'RPG'
% verifica se Jogo é um RPG
% verifica se IdadeJogador é maior ou igual que IdadeCensura

censura(Pessoa, Jogo) :-
	jogador(Pessoa, IdadeJogador),
	joga(Pessoa, Tipo, IdadeIndicativa),
	jogo(Jogo, Tipo, IdadeIndicativa),
	IdadeJogador >= IdadeIndicativa.

```
