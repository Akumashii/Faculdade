# Automato Finito Determinístico

ele é amemoriado, ele não tem memória do que foi feito e processado, mantém apenas as informações passadas necessárias para determinar a ação para a próxima entrada.

Ele é comporto por 3 partes

### Fita de Entrada

- Dispositivo de entrada que contém o dado a ser processado
- A fita é finita à esquerda e infinita à direita
- Cada célula da fita armazena um símbolo pertencente a um alfabeto de entrada
- Não é possível gravar sobre a fita. Acontece somente a leitura de um símbolo de cada vez.
- Inicalmente, a palavra de entrada ocupa toda fita.

### Unidade de Controle

- Reflete o estado corrente da máquina (á um número finito e prédefinido de estados).
- Possui uma unidade de leitura (cabeça da fita) que acessa uma célula da fita de cada vez e movimenta-se exclusivamente para direita (uma célula).
- A unidade de leitura inicia sempre à esquerda da fita.

### Programa ou Função de Transição

- Comanda as leituras e define o estado da máquina.
- É uma função parcial (cada elemento do domínio está relacionado com no máximo um elemento do contradomínio - estado e símbolo).
- Determina o novo estado do autômato.

# Automato Finito Determinístico

Um autômato finito sempre para ao processar qualquer palavra, a parada de um autômato pode ser de duas maneiras: aceitando o ou rejeitando a palavra w.
Condições de parada:
- Processa o último símbolo da fita e assume um estado final: Aceita
- Processa o último símbolo da fita e assume um estado não final: Rejeita
- Função programa indefinida para o argumento: Rejeita
