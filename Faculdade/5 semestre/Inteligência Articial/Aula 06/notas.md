# Métodos de Busca
- Cega -> força bruta
  - Dedutivo
    - Pilha (Recursiva SO)
    - Visitado 
  - Largura/Amplitude
    - Fila
    - Visitados
    - (Fila + Visitados) = Árvore Completa
   
### Herística -> Informação -> "Dica"

métodos heurísticos (com função "visitados"):
- Subida da encosta/montanha - Climb Hill
  - profundidade -> pilha recursiva
  - custo Real - g(h) - olha o 
- Guloso
  - Amplitude/Largura -> Fila
  - Custo Estimado - h(n) 
- A*
  - Amplitude -> Fila
  - Combinação -> custo real (corrigido) + custo estimado
    - custo real acumula a cada novo nó, enquanto o custo estimado permanece do próximo nó
    - exemplo: cR = custo real, cE = custo estimado;
      - └> cR1 + cE
        - └> (cR1 + cR2)+ cE
          - └> (cR1 + cR2 + cR3) + cE
            - └> (cR1 + cR2 + cR3 + ...) + cE

Heurística ou Informação
- └> custo REAL - g(h) 
- └> custo ESTIMADO (heurístico) - h(n)

  
