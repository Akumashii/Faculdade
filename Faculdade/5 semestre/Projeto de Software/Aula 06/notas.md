# Aula Prática

Essa aula vamos usar o Intellij.

### Como funciona quando quer acessar algo que ta na web?
constituído basicamente por 4 passos

- (1)Pessoa -> Servidor || passa o endereço. Uma requisição ao servidor
- (2)Servidor -> Controler || 
- (3)Controler -> Servidor || 
- (4)Servidor -> Pessoa(por <HTML>) || retorna em formato <HTML>

- <HTML> = linguagem de renderização
- http (protocolo de internet)

Pessoa entra em contato com o Servidor (Pessoa -> IP:porta/_(endpoint)_ -> Servidor);
- exemplo: ufn.edu.br / agenda (parte do site que quero acessar, endpoint)


apache tomcat, ideia de rede

- spring initializr
	- ferramenta para criar meu projeto, compacta numa pasta

---

# Projeto
vamos usar os padrões:
- MVC
- service
- repository

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

Adicionando imagem:
- CRUD/src/main/resource/static -> arraste para pasta seu arquivo (seja jpg., gif. ou outro)

Aplicando imagem:
- CRUD/src/main/resource/template -> crie "gato.html"
``` html
<body>
    <h1>ITS NYAN CAT MFFFF ~~♥ </h1>
    <img src="../static/nyan_cat.gif" style="width: 50%">
</body>
```

### Template e Static

importante frisar a diferença entre Static e Template. 
- Static é "público", então é visível sem barreiras, sem bloqueios de segurança
- Template é "private", ele só pode ser acessado via código, responsábilidade do Controller acessar templates

---

## Controller
Intermediador de Requisições, request & response

- crie um pacote **Controller** em: CRUD/src/main/java/com.example.crud
- crie dentro de **Controller** uma classe java chamada **WebController**

a classe que estou criando é de **CONTROLE** então para o spring saber disso adicionamos: **@Controller**

``` java
package com.example.crud.controller;

import org.springframework.stereotype.Controller;

@Controller // <-----
public class WebController {   
}
```

usando o Thymeleaf ele ajuda na ideia de resposta quando trabalhamos com HTML. Ele pode retonar, e somente retornar, html em métodos String (não sei se outros)

Nesse contexto, criamos:
``` java
@Controller
public class WebController {
    @GetMapping("/gato")
    //o caminho "/gato" vai nos levar para "mostraGato()" que nos leva para "gato.html"
    // /gato -> mostraGato() -> gato.html
    public String mostraGato(){
        return "gato";
    }
}
```


---

## Anotações
Importamos mais dependências, vamos em pom.xml e encontramos no início de <dependencies> o botão "add starters".
- MySQL Driver (servidor de dados)
- Spring Data JPA

### MySQL Driver

localhost: 3306
user: root
senha: laboratorio

no IntelliJ vamos em Database
- clicamos para adicionar "Data Source>"
- adicionamos MySQL (imagem de golfinho)

eu preciso guardar informações como usuário e senha em algum lugar, assim usamos o **application.properties**

``` application.properties
spring.application.name=CRUD
# forma de update das entidades
# create-drop, cria e exclui ao fim da sessão
spring.jpa.hibernate.ddl-auto=create-drop

# URL de conexão e comando de criação
spring.datasource.url=jdbc:mysql://localhost:3306/CRUD?createDatabaseIfNotExist=true

# Usuario
spring.datasource.username=root

# Senha
spring.datasource.password=laboratorio
```

Instruções:
- Abra o MySQL Workbench e conecte o usuario root c/ senha laboratorio
- Vá ao IntelliJ e rode
- conforme tenha dado tudo certo com minhas instruções anteriores, agora ao rodar o IntelliJ o banco de dados CRUD foi criado, para conferir consulte o MySQL Workbench

---

## Model
Classes que servem para guardar informações/atributos, esta é sua única função

Model é uma classe que representa uma quantidade de informações que irão para o banco de dados

- crie um pacote **Model** em: CRUD/src/main/java/com.example.crud
- crie dentro de **Model** uma classe java genérica chamada **Produto**

nesta implementamos:
``` java
package com.example.crud.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Produto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nome;
    private String descricao;
    private double preco;
    private int quantidade;
    private String imagem;
}

```
