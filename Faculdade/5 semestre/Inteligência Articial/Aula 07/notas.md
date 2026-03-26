# Revisão

### Métodos de Busca
- SOLUÇÃO PARA PROBLEMAS
	- gerar ou atinger Estados(s) desejado(s)
	- gerar ou produzir passo-a-passo até o Estado(s) desejado(s)

### Problemas que a IA resolve

1) Diagnóstico, reconhecimento de padrão
2) Problemas que não se sabe como chegar no estado final

### Técnicas de IA geram ou constroem SISTEMAS DE COMPORTAMENTO INTELIGENTE
- Base de Conhecimento
- Motores de Racicínio -> DEDUÇÃO e INDUÇÃO
	- algoritmos de busca
 		- cega ou força bruta
   		- profundidade
			- largura/amplitude
		- informados ou heurísticos
			- CUSTOS
		  	- real g(n)
				- estimado ou heurístico h(n) (do especialista) -> ADMISSÍVEL ou INADMISSÍVEL 
			- MÉTODOS
   			- Subida de Encosta -> baseado no profundidade e foca no custo real
				- Guloso -> baseado no amplitude e foca no custo estimado
				- A* -> baseado no amplotude e soma custo real (acumulado) com custo estimado -> com isso, pode corrigir a heurística
				  - a heurística é ESTÁTICA
