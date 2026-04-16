# Repetição Prolog

Repetição funciona em três etapas:
1) inicialização da variável de controle
2) teste de parada/continuar
3) tranformação da variavel de controle

---

``` prolog
% Algoritmo Recurso simples para escrever números inteiros
% em ordem DECRESCENTE/DESCENDENTE

escrever(N) :-
	N == 0,
	!.

escrever(N) :-
	writeln(N),
	Proximo is N - 1,
	escrever(Proximo).	
```

---

``` prolog

% Algoritmo Recurso simples para escrever números inteiros
% em ordem CRESCENTE/ASCENDENTE

escrever(N) :-
	N == 0,
	!.

escrever(N) :-
	writeln(N),
	Proximo is N - 1,
	escrever(Proximo).	
```

---

``` prolog
progenitor("mãe", "filha")

ascendente(A, D) :-
	progenitor(A, D).
ascentende(A, D) :-
	progenitor(A, D),
	ascentende(I, D).


descendente(D, A) :-
	progenitor(A, D).
descentende(D, A) :-
	progenitor(A, I),
	descendente(D, I).
```

---

``` prolog
estrada(a, b).
estrada(b, c).
estrada(c, d).
estrada(d, e).
estrada(e, f).

caminho(De, Para) :-
	estrada(De, Para).
caminho(De, Para) :-
	estrada(De, I),
	caminho(I, Para).
```

``` prolog

ingrediente(a).
ingrediente(b).
ingrediente(c).
ingrediente(d).
ingrediente(e).

mostrar:-
	forall(ingrediente(X), writeln(X)).
```
