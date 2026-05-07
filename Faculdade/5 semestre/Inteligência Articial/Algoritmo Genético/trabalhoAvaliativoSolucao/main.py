import copy
import os
import time
import random

from ag import AG


"""
Algoritmo Genético usa os seguintes operadores:
1) População, tamanho de indivíduos da geração
2) Geração, iterações da população → processo evolutivo
3) Seleção, recorte dos indíduos mais aptos para reprodução (apitidão)
4) Reprodução, apartir da seleção gera novos indivíduos
5) Mutação, alteração aleatória de um indivíduo para aumentar a diversidade genética
6) Aptidão, avaliação de um indivíduo para o problema em questão

Indivíduo ou Cromossomo, é a representação de uma possível solução.
- preenche população (selecionado e reproduzido)
- tem um valor e uma aptidão
- pode sofre mutação

-----------------------------------------------------------------

Orientada a Objetos:

Cromossomo pode ser uma classe com:
- atributos: valor e aptidão
- construtor
- método para calcular a aptidão (heurística dinâmica)

Criar uma classe Util como métodos utilitários ao problema

Criar uma classe para aplicar o AG:
- tamanhoPopulacao
- quantidadeGeracoes
- taxaSelecao / taxaReproducao
- taxaMutacao
- neste caso em especial, palavraFinal [1,2,3,4,5,6,7,8,9]

-----------------------------------------------------------------

Fluxo do AG:
1) Gerar população inicial
2) Ordena e avalia a aptidão de cada indivíduo
- Loop até atingir a quantidade de gerações:
3) Selecionar os indivíduos mais aptos para reprodução
4) Reproduzir os indivíduos selecionados para gerar a nova população
5) Mutar alguns indivíduos da nova população (percentagem de mutação ou frequencia de mutação)
6) Ordenar e avaliar a aptidão de cada indivíduo da nova população
7) Apagar população antiga e substituir pela nova
8) Exibir a nova população

depois repetir processo até atinger objetivo ou atingir a quantiadade de iteralççoes de gerações estabelicida

"""

os.system('cls')

#Entrada de Dados pelo Usuario
tamanho_populacao = int(input("Tamanho da população: "))
qtd_geracoes = int(input("Quantidade de gerações: "))
taxa_selecao = int(input("Taxa de seleção (entre 20 a 40%): "))
taxa_reproducao = 100 - taxa_selecao
taxa_mutacao = int(input("Taxa de mutação (entre 5 a 10%): "))

populacao = []
nova_populacao = []

AG.gerar_populacao(populacao, tamanho_populacao)
populacao.sort(key=lambda cromossomo: cromossomo.aptidao)
print("----------------------------------------------")
print("Geracao n° 1")
AG.exibir_populacao(populacao, 0)


for i in range(1, qtd_geracoes):
    AG.selecionar_torneio(populacao, nova_populacao, taxa_selecao)
    AG.reproduzir(populacao, nova_populacao, taxa_reproducao)
    
    #random.random() retorna entre 0 e 1 - 0% a 100%
    #assim, se a taxa de mutação for 5%, há 5% de chance de ocorrer a mutação
    if random.random() < taxa_mutacao:
        AG.mutar(nova_populacao, taxa_mutacao)
    
    populacao.clear() #limpa a antiga população
    populacao = copy.deepcopy(nova_populacao)#substitui pela nova população
    nova_populacao.clear()#limpa a nova população para a próxima geração
    populacao.sort(key=lambda cromossomo: cromossomo.aptidao)#ordena a população pela aptidão

    #exibe
    AG.exibir_populacao(populacao, i + 1)
    