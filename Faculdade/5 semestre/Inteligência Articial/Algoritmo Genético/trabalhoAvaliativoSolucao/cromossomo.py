
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

        # primeira restrição
        for i in range(0,len(self.rota)-1):
            if (self.rota[i] > self.rota[i+1]):
                nota_restricao += 10
               
        #segunda restrição
        for i in range(0, len(self.rota)):
            #cout retorna a quantidade de vezes que o elemento aparece na lista, se for maior que 1 é porque tem repetição
            if self.rota.count(self.rota[i]) > 1: 
                nota_restricao += 20

        """ Esse trecho abaixo faz exatamento oque acima faz utilizando o count().
        
        analisados = list()
        for cidade in self.rota:
            ocorrencias = 0

            #se já foi analizada sem necessidade de vê-la novamnete
            if cidade not in analisados: 
                analisados.append(cidade)

                #faz a comparação da cidade com todos os elementos da rota para contar as ocorrências
                for c in self.rota:
                    if cidade == c:
                        ocorrencias += 1

                #há ocorrencia de cidade repetida
                if ocorrencias > 1:
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


