import random
import time
import copy
from cromossomo import Cromossomo

class AG:

    @staticmethod
    def gerar_populacao(populacao, tamanho_populacao):
        
        rota = list()

        for i in range(tamanho_populacao):
            for j in range(1,10):
                rota.append(j)

            random.shuffle(rota)#embaralhar a rota

            novo_cromossomo = Cromossomo(copy.deepcopy(rota))
            novo_cromossomo.aptidao = novo_cromossomo.calcular_aptidao()

            populacao.append(novo_cromossomo) #deepcopy faz uma cópia da rota para não alterar a rota original, perigo de apontar para o mesmo espaço de memória
            rota.clear()
    
    @staticmethod
    def exibir_populacao(populacao, numero_geracao):
        print("----------------------------------------------")
        print(f"\n\nGeração n° {numero_geracao}")
        for individuo in populacao:
            print(individuo)

    @staticmethod
    def selecionar_torneio(populacao, nova_populacao, taxa_selecao):
        #definir quantos serao SELECIONADOS
            #REGRA DE TRES
        #len(populacao)             - 100
        #quantidade_selecionados    - taxa_selecao
        quantidade_selecionados = int(len(populacao) * taxa_selecao / 100)
        

        torneio = list()

        #elistimo - o mais apto sempre é selecionado
        nova_populacao.append(populacao[0])

        i = 1
        """
        agora usamos a idea de torneio (ideal para grandes populações):
        - selecionar 3 individuos aleatorios da população
        - comparar a aptidao dos 3 individuos
        - selecionar o mais apto para a nova população
        """
        while (i < quantidade_selecionados):
            c1 = populacao[ random.randrange( len(populacao) ) ]

            while (True):
                c2 = populacao[ random.randrange( len(populacao) ) ]
                if c1 != c2:
                    break

            while (True):
                c3 = populacao[ random.randrange( len(populacao) ) ]
                if (c1 != c3) and (c2 != c3):
                    break
            
            torneio.append(c1)
            torneio.append(c2)
            torneio.append(c3)

            #key=lambda cromossomo ordena a lista pelo atributo aptidao
            torneio.sort(key=lambda cromossomo: cromossomo.aptidao)
            selecionado = torneio[0] #mais apto é o primeiro da lista pois ordenamos
            if selecionado not in nova_populacao:
                nova_populacao.append(selecionado)
                i+=1

            torneio.clear()         

    @staticmethod
    def reproduzir(populacao, nova_populacao, taxa_reproducao):
        #definir a quantidade de REPRODUZIDOS
            #REGRA DE TRES
        #len(populacao)             - 100
        #quantidade_reproduzidos    - taxa_reproducao
        quantidade_reproduzidos = int(len(populacao) * taxa_reproducao / 100)

        for i in range(int(quantidade_reproduzidos/2)+1):
            #há a relação entre cromossomo pai e cromossomo mãe, selecionaremos dois distintos entre si
            cromossomo_mae = populacao[ random.randrange( len(populacao) ) ]

            while (True): #pra não selecionar o mesmo cromossomo da mae
                cromossomo_pai = populacao[ random.randrange( len(populacao) ) ]
                if cromossomo_mae != cromossomo_pai:
                    break

            pai = cromossomo_pai.rota
            mae = cromossomo_mae.rota
            meio = len(pai) // 2

            #aqui é feito o filho1 e filho2. PERGUNTA: é necessário criar 2 filhos? posso criar mais ou menos?
            #primeira metade do pai + segunda metade da mae
            f1_rota = pai[:meio] + mae[meio:]
            f2_rota = mae[:meio] + pai[meio:]
            
            nova_populacao.append(Cromossomo(f1_rota))
            nova_populacao.append(Cromossomo(f2_rota))

            #podar os excedentes da lista
            while (len(nova_populacao) > len(populacao)):
                nova_populacao.pop()
      
    

    @staticmethod
    def mutar(populacao, taxa_mutacao):
        quantidade_mutantes = int(len(populacao) * taxa_mutacao / 100)
        while (quantidade_mutantes > 0):
            #seleciono um cromossomo aleatorio para ser o mutante
            posicao_mutante = random.randrange( len(populacao) )
            mutante = populacao[ posicao_mutante ]
            
            #alterar completamente o cromossomo mutante, refazendo ele do zero
            #assim da uma agitada na população quebrando estagnação evolutiva
            mutante.rota[ random.randrange(len(mutante.rota)) ] = random.randrange(1,10)
            mutante.aptidao = mutante.calcular_aptidao()
            
            quantidade_mutantes -= 1
