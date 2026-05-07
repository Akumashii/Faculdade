
"""
1) uma cidade de número maior vier primeiro que uma cidade de número menor, deve ter restrição com nota 10;
2) se na rota aparecer mais de uma vez a mesma cidade (número); para cada par de ocorrência dar nota 20.
"""

class Cromossomo:
    
    def __init__(self, rota):
        self.rota = rota
        self.aptidao = self.calcular_aptidao()
    
    def calcular_aptidao(self):    
        nota_restricao = 0

        
        # 1ª RESTRICAO: Ordem (Cidade maior antes de menor)
        for i in range(0, len(self.rota) - 1):
            if self.rota[i] > self.rota[i+1]:
                nota_restricao += 10

        # 2ª RESTRICAO: Duplicatas (Par de ocorrência)
        # Vamos contar as duplicatas de um jeito simples e infalível
        for i in range(len(self.rota)):
            for j in range(i + 1, len(self.rota)):
                if self.rota[i] == self.rota[j]:
                    nota_restricao += 20
        

        """
        # primeira restrição
        for i in range(0,len(self.rota)-1):
            if (self.rota[i] > self.rota[i+1]):
                nota_restricao += 10
               
        #segunda restrição
        for i in range(0, len(self.rota)):
            #cout retorna a quantidade de vezes que o elemento aparece na lista, se for maior que 1 é porque tem repetição
            if self.rota.count(self.rota[i]) > 1: 
                nota_restricao += 20
        """

        """
        for i in range(0,len(self.rota)-1):
            for j in range(0,len(self.rota)-1):
                if(self.rota[i] == self.rota[j] and i != j):
                    nota+=20
        """
        
        """
        # primeira restrição
        for i in range(0,len(self.rota)-1):
            if (self.rota[i] > self.rota[i+1]):
                nota_restricao += 10
        
        analisados = list()
        for cidade in self.rota:
            ocorrencias = 0
            if cidade not in analisados:
                analisados.append(cidade)
                for c in self.rota:
                    if cidade == c:
                        ocorrencias += 1

                if ocorrencias > 1:
                    # print('bingo...')
                    nota_restricao += 20
        """

        return nota_restricao
    

    def __eq__(self, other):
        if isinstance(other, Cromossomo):
            return self.rota == other.rota
        return False
    
    def __gt__(self, other):
        return self.aptidao <= other.aptidao
    
    def __str__(self):
        return f"rota= {self.rota}, aptidao= {self.aptidao}"
        # return "rota=" + str(self.rota) + ", aptidao=" + str(self.aptidao )


