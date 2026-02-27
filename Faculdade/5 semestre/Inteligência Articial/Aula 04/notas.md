# Problema da Jarra

Há duas jarras, j1 e j2, j1 possui capacidade de 4 litros, j2 possui capacidade de 3 litros. Objetivo é encher uma das duas jarras com 2 litros.

- estados
  - estado inicial: j1 = 0 && j2 = 0
  - estados finais:
    - j1 = 2 && j2 = 0
    - j1 = 0 && j2 = 2
- regras de transição
  1) encher j1
  2) encher j2
  3) esvaziar j1
  4) esvaziar j2
  5) despejar j1 em j2
  6) despejar j2 em j1 
- restrições
  - nenhuma
- visitados (contador de estado)
  - armazenar estados visitados, assim para podar a árvore e descartar etapas/processos desnecessários
