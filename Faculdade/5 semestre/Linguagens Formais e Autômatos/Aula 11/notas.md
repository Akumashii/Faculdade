# Minimização de AF

Minimização consiste em encontrar o AF equivalente com o menor número de estados possíveis

Pré-requisitos para aplicar o algoritmo de minimização
1) O AF deve ser determinístico, caso não seja deve ser transformado em AFD
2) O AF não deve conter estados inacessíveis (estados que não podem ser alcançados a partir de q0)
3) A função programa do AF deve ser TOTAL (para cada estado do AF, devem existir transições com todos os símbolos do alfabeto)

se não for total, deve se fazer o seguinte:
- inserir um estado "d" não final
- cirar as transições com símbolos faltantes tendo como destino o estado "d"
- criar um ciclo em "d" com os símbolos do alfabeto

# Algoritmo de Minimização
irá procurar estados equivalentes no AF, a procura é por exclusão, os estados equivalentes serão unificados ao término do processo de minimização

## Passos do Algoritmo

1) Construção da Tabela
2) Marcação dos estados TRIVIALMENTE não equivalentes. Marca na tabela os pares {estado final, estado inicial}
3) marcação dos estados não equivalentes
