# Computação Evolutiva: Algoritmos Genéricos
- Quando usar?
	- Quando há desconhecimento do estado final e há muuuita restrição
- Oque é? 
	- É um motor de raciocínio, com método de busca, com capacidade de teste de 'n' vezes, diferente dos métodos de busca anteriormente estudados (exemplo: A*).
	- Modelo computacional baseado em teorias: Seleção Natural, Hereditariedade (Genética)

Métodos de busca é o princípio de gerar e testar, o espaço de busca que estudamos é árvore onde é testado 1 estado por vez, a cada vez.
- gerar e testar 1 por vez. Herística Estática.

Há problemas com muita regra/exceção, nesses gerar e testar é desgastante, muito 'if'.

Chegar no estado com menos restrições feridas, onde é incrementado pontos a cada restrição ferida. Assim o estado final é o mais próximo de 0 (ou ao contrário).
- gerar e testar n por vez (paralelo), aproveita da Teoria da Evolução e Genética. Heurística Dinâmica
- precisa-se diferenças genéticas para ter resultado diferentes

Computação evolutiva é extremamente baseada na Teoria da Evolução, usando princípios 
Técnicas da Genética:
- seleção artificial
- geração(?)
- mutação

Sub-áreas
- Algoritmos Genéticos
- Estratégias de Evolução
- Programação Genética

Seleção é feita com base em uma porcentagem pequena da população, enquanto o resto é descartado. Também e feita uma seleção sortida com peso, os mais aptos tem maior probabilidade de serem selecionados.

Toda tarefa de busca ou otimização possui:
- Estado inicial(ais) ou final(ais)
- Regras de transição
- Espaço de busca (possibilidades de solução de um problema)
- Função de avaliação (

## Algoritmos Genéticos (AG) 
Metodo de resolução de problemas
- Busca de Soluções em Espaço de Estados
	- Estados produzidos são prováveis soluções ou indivíduos da população, denominados CROMOSSOMOS
	- Os operadores ou rergas de transição de estados são MACANISMOS DE SELEÇÃO E DE REPRODUÇÃO que tentam encontrar melhores soluções (ou indivíduos)
		- Sobrevivência do mais Apto (melhores soluções a cada geração)
		- Cruzamento (crossover)
		- Mutação
- É possível operar sobre uma população de candidatos (espaço de estados) em PARALELO
- Usa a estratégia de gerar e testar

#### Fluxograma

<img width="761" height="566" alt="{5FDB9B81-BEA2-421B-B643-EED1741EE1FC}" src="https://github.com/user-attachments/assets/f772e8d5-b4d0-4ba5-844e-032ef55b9e7e" />
![Uploading {5FDB9B81-BEA2-421B-B643-EED1741EE1FC}.png…]()

Cálculo de Aptidão
