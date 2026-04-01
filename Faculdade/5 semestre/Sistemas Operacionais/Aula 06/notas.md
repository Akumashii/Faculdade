# Lista de Exercícios

## anotações

vamos utilizar Pthreads (POSIX Threads), padrão POSIX para threads - lembrando que threads é programação paralela. Biblioteca POSIX threads (Pthreads) é uma API para C/C++.

A função em Pthreads deve:
- Retornar void*
- Receber um argumento do tipo void* (ponteiro genérico)
- Caso seja necessário passar mais de um dado para a thread, deve-se utilizar estruturas (struct).

A função main é a thread principal do programa, a partir dela criamos nova threads com pthreads_create

Instanciamento das threads:
- 1º argumento: identificador da thread (usar '&' para endereço)
- 2º argumento: atributos (NULL = padrão)
- 3º argumento: função a ser executada
- 4º argumento: parâmetro passado para a função (void*)



