### Problemas que a IA resolve

1) Diagnóstico, reconhecimento de padrão
2) Problemas que não se sabe como chegar no estado final


### Oque é uma IA?

Primeiro de tudo, é uma área da ciência da computação onde envolve técnicas e algoritmos para resolver aqueles tipos de problemas

### Áreas da IA a serem exploradas

- Métodos de busca:
  - cegos ou força bruta: amplitude e profundidade
  - heurísticos: Guloso, Subida de Encosta, A*, Algoritmos Genéticos
- Redes Neurais
- Sistemas Multiagentes
- Representação de Conhecimento
- Processamento da Língua Natural  

### Oque é um sistema de comportamento inteligente?

Um sistema composto por base de conhecimento (fatos e regras, ou crenças e plano), Raciocínio Automatizado (dedução e indução) e Aprendizado de Máquina (treinamento por repetição ou amostras)

### Que tipo de RNA resolve?

Problemas de reconhecimento de padrões ou em que a presença do especialista é fundamental

### Quais características que um problema apresenta quando ele tem alta complexidade (esforço)?

- restrições
- desconhecimento do estado final
  - ela entrega o passo a passo   

### No processo de modelagem de soluçao de problemas na área de IA, oque se deve modelar?

- Estados: inicial(ais) e final(ais) -> é uma possível solução, é um instante do processo de solução
  - atributos
- Regras de transição

---

Base de Conhecimento
- Experiência
- Amostra

Raciocínio
- Dedutivo
- Indutivo

Motor
- Força Bruta
  - └-> Amplitude
  - └-> Profundidade
- Heurística
  - └-> Subida Eucasto
  - └-> Guloso
  - └-> A*
  - └-> Algoritmo Gen

 ---

 Jogo da Rainha
Um tabuleiro com N x N de xadrez precisa receber N rainas. O objetivo é oclocar as N rainhas no tabuleiro, uma a uma, de forma que nenhuma rainha 'coma' outra rainha (regras do xadrez).

Passos de modelagem: 
1) Estados do problema (inicial, final e os intermediários)
  - objeto de uma classe com atributos diferentes em cada momento da solução
  a) matriz N x N de inteiro, onde 0 indica que não há rainha e 1 indica que há rainha naquela posição
  b) variavel contabilizando o total de rainhas que estão no tabuleiro (int)

  Estado inicial
    matriz inicializada com 0
    Por exemplo, assumindo que o N é 4
      matriz
      0  0  0  0
      0  0  0  0
      0  0  0  0
      0  0  0  0
      - qtd rainhas = 0
  
  Estado final (objetivo/meta)
    Por exemplo, qtdRainhas == 4

2) Regras de transição == métodos == operações
  Por exemplo,
  a) colocar uma rainha em um slot vazio ou célula == 0

3) Restrições ou método ehValidado()

4) Visitados
  - Tradicional = listas
  - Arrojada = Árvore
  - Ideal = Hash

5) Função objetivo ou meta

```java
public class Rainha {
  static List<Rainha> visitados = new LinkedList<>();

  int matriz[][];
  int qtdRainha;

  public Rainha(int tamanhoTabuleiro) {
    this.matiz = int(tamanhoTabuleiro, tamanho Tabuleiro);
    this.qtdRainha = 0;
    for (int i = 0; i < this.matriz.size(); i++) {
      for (int j = 0; j < this.matriz.size(); j++) {
        matriz[i][j] = 0;
      }
    }

    public Rainha(int proximaRainha) {
    //metodo para percorrer os slots/celular para encontrar um slot vago e entao depositar uma rainha (lista, coluna)
    }

    public boolen ehMeta(int tamanhoTabuleiro){
      return this.qtdRainha == tamanhoTabuleiro;
    }

    public boolean ehValido(Rainha novo) {
      //metodo que avalie a matriz do novo verificando se há mais de uma rainha: na linha, na coluna, na diagonal principal e na diagonal secundária
    }






}
```
