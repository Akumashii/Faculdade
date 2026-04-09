# Atividade - Domínio: Sistema Escolar

1) Pré-requisitos: Crie fatos disciplina(Nome) e pre_requisito(Anterior, Posterior). Escreva uma regra pode_cursar(Aluno, Disciplina) que verifica se o aluno já completou os requisitos necessários.

2) Aprovação: Com fatos nota(Aluno, Disciplina, Valor), crie a regra aprovado(Aluno, Disciplina) (nota >= 7.0) e reprovado (Aluno, Disciplina) (nota < 7.0).
   
``` prolog
% QUESTÃO 1 & 2

disciplina("Inteligência Artificial").
disciplina("Estrutura de Dados").
disciplina("Algoritmos B").

pre_requisito("Algoritmos B", "Estrutura de Dados").
pre_requisito("Estrutura de Dados", "Inteligência Artificial").


ja_cursou("Luiza", "Algoritmos B").
ja_cursou("Vanessa", "Estrutura de Dados").
ja_cursou("Diana", "Inteligência Artificial").


pode_cursar(Aluno, Disciplina) :-
	ja_cursou(Aluno, Pre),
	pre_requisito(Pre, Disciplina).

nota("Luiza", "Algoritmos B", 5.0).
nota("Vanessa", "Estrutura de Dados", 7.0).
nota("Diana", "Inteligência Artificial", 9.0).

aprovado(Aluno, Disciplina) :-
    nota(Aluno, Disciplina, Valor), 
    Valor >= 7.0. 

reprovado(Aluno, Disciplina) :-
    nota(Aluno, Disciplina, Valor), 
    Valor < 7.0. 
```
# Atividade - Domínio: Logística e Localização

3) Conectividade de Cidades: Defina fatos estrada(CidadeA, CidadeB). Crie a regra pode_viajar(De, Para) que indica se há uma conexão direta. Bônus: discuta por que estrada(a, b) não implica automaticamente estrada(b, a) sem uma regra de simetria
4) Localização: Use fatos esta_em(Objeto, Comodo) e comodo_em(Comodo, Casa). Crie a regra localização_geral(Objeto, Casa) para inferir onde o objeto está no nível da propriedade.

``` prolog
% QUESTÃO 3
%FATO conexão das cidades A -> B
estrada("Santa Maria", "Santa Cruz").
estrada("Santa Cruz", "Porto Alegre").
estrada("Santa Maria", "Uruguaiana").

% Para dizer que A esta para B e B esta para A podemos 
% implementar uma nova regra para 
conectado(X, Y) :- estrada(X, Y).
conectado(X, Y) :- estrada(Y, X).

%REGRA verifica se posso viajar da cidade A -> B
pode_viajar(CidadeA, CidadeB) :-
    conectado(CidadeA, CidadeB).
 
%-------------------------------------------------

% QUESTÃO 4

```

# Atividade - Domínio: Recomendação e Preferências

5) Cardápio: Crie fatos ingrediente(Prato, Item) e vegado(Item). Escreva a regra prato_vegano(Prato) que é verdadeira apenas se todos os ingredientes forem veganos (útil para introduzir o conceito de negação ou falha)
6) Streaming: Com fatos filme(Nome, Genero) e usuario_gosta(Usuario, Genero), crie a regra recomendar(Filme, Usuario).

# Atividade - Domínio: Mundo de Blocos (Clássico da IA)

7) Empilhamento: Use fatos sobre(BlocoA, BlocoB) (A está em cima de B) e no_chao(BlocoB). Crie a regra abaixo(X, Y) e a regra bloco_livre(X) (se não há nada sobre ele).

# Atividade - Domínio: Classificação e Regras de Negócio

8) Zoologia Básica: Crie fatos sobre características (ex: tem_penas(pinguim), poe_ovos(pinguim)) e regras para classificar: ave(X) :- tem_penas(X), poe_ovos(X).
9) E-commerce: Com fatos cliente(Nome, Saldo) e produto(Item, Preco). Crie a regra pode_comprar(Nome, Item).
10) Torneio de Jogos: Com fatos venceu(JogadorA, JogadorB). Crie uma regra invicto(Jogador) que verifica se ninguém venceu aquele jogador.
