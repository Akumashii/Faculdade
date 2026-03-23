# Aula Prática

Essa aula vamos usar o Intellij.

### Como funciona quando quer acessar algo que ta na web?
constituído por 2 passos

Pessoa -> Servidor -> <HTML> -> Pessoa

Pessoa entra em contato com o Servidor (Pessoa -> IP:porta/_(endpoint)_ -> Servidor);
- exemplo: ufn.edu.br / agenda (parte do site que quero acessar, endpoint)

http (protocolo de internet)

apache tomcat, ideia de rede

- spring initializr, ferramenta para criar meu projeto, compacta numa pasta

## Projeto

### Configuração 

vamos usar Spring Boot, linguagem: Java; tipo: Maven

Dependências:
- Lombok
- Spring Boot DevTools
- Spring Boot Web
- Thymeleaf (adicionado dps)

Mavem Repository, site para pegar dependências. Assim podemos adicionar na pom.xml depois uma nova dependência, no caso do Thymeleaf agora.

.xml -> arquivo que funciona como estrutura de dados, 

Feito isso, nossa configuração de rede está completa

### Anotações

CRUD/src/main/java/com.example.crud/CrudApplication -> é nossa "main", nosso único executável.

CRUD/src/main/resource/static -> crie um html "index.html"
- por padrão ele já está configurado de fábrica

sobre html:
- <head><\head> -> contém metadada (dados sobre dados)
- <body><\body> -> contém todo conteúdo visível, oque é exibido como parte de uma página de um site, como: texto, imagem, video, link

Configure:
- Setting -> Build, Execution, Deployment -> Compiler
  - marque: build projetc automatically
- Setting -> Advanced Settings -> Compiler
  - marque: allow to auto-make to start even if development application is currently running

### adicionando 

 
