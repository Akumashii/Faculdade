# Chamada ao Sistema (System Call)

As Chamadas ao Sistema fornecem a interface entre uma aplicação e o sistema operacional para acesso ao hardware

System Calls:
- Instruções em assembly
- Podem ser escritas em uma linguagem de nível mais alto como C ou C++
- Acessada pelos programas de alto nível por meio da API
- Programa de alto nível -> pode gerar outras chamadas
- In-line

É necessário o mecanismo de interrupções

API disponíveis aos compiladores pelos Sistemas Operacionais, por exemplo a API para manipulação de arquivos em C:
1) Criar o novo arquivo copia.txt (abrir - criando - em modo de escrita)
2) Abrir o arquivo original.txt em modo leitura
3) Ler 1 linha no arquivo original.txt
4) Gravar 1 linha no arquivo copia.txt
5) Repetir passos 3º e 4º enquando não for o fim do arquivo
6) Fechar o arquivo orginal.txt
7) Fechar o arquivo copia.txt

Maioria das linguagens oferece interface mais simples, pois, detalhes da interface do sistema operacional são ocultos ao programador através do compilador e do pacote de suporte ao programador através do compilador e do pacote de suporte à execução, **não é necessário conhecer como a system call é implementada**

3 métodos para passado os parâmetros às chamadas:
1) Registradores (mais simples)
2) Bloco ou tabela na memória e o endereço do bloco é passado ao registrador (não limita a quantidade de parâmetros)
3) Inseridos (push) na pilha do sistema pelo programa e lidos/removidos (pop) pelo SO (não limita a quantidade de parâmetros)

Categorias de System Call:
- Controle de processo
- Gerência de arquivos
- Gerência de dispositivos
- Manutenção de informações
- Comunicação


