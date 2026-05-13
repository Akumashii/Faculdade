#  Monitor

Funcionamento: 
- Exclusão Mútua:
- Variáveis de Condição
.
.
.

# Semáforo

- Acquire (adquirir): uma thread tenta obter uma permissão. Se nenhuma permissão estiver disponível, a thread é bloqueada até que uma permissão seja liberada por outra thread.
- Release (liberar): uma thread libera uma permissão, tornando-a disponível para outra thread que possa estar esperando.

# Evolução do problema...

Há vários conceitos a se considerar:
- wait()
- notify()
- Semáforos
- buffer cheio/vazio
- exclusão mútua

Assim o código fica mais complexo...

# BlockingQueue

Muito utilizada no desenvolvimento moderno.  
Implementa:
- Sincronização
- espera por espaço livre
- espera por itens disponíveis
- conunicação entre threads


Funcionamento:
---

Inserção: 
- fila.put(item)
- se a fila estiver cheia, a thread espera automaticamente

Remoção: 
- fila.take(item)
- se a fila estiver vazia, a thread espera automaticamente

esta função BlockingQueue faz esta implementação automatizada, sem recorrer a construções manuais com wait() e notify() por exemplo.



