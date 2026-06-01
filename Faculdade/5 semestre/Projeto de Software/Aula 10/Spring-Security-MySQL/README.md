# Spring Security com MySQL

Este projeto é um exemplo simples de autenticação e autorização utilizando Spring Boot, Spring Security, Thymeleaf e MySQL. Foi desenvolvido como um MVP para fins educacionais, demonstrando controle de acesso baseado em papéis (roles) e integração com banco de dados relacional.

## 🔐 Funcionalidades

* Login com autenticação baseada em banco de dados
* Controle de acesso por papéis: `ADMIN` e `USER`
* Redirecionamento pós-login para página de boas-vindas
* Painel administrativo acessível apenas por administradores
* Logout com redirecionamento para a página de login
* Criptografia de senhas com BCrypt
* Inicialização automática de usuários via `CommandLineRunner`

## 🧰 Tecnologias Utilizadas

* Java 17
* Spring Boot 3.x
* Spring Security 6.x
* Spring Data JPA
* Thymeleaf
* MySQL
* Maven

## ⚙️ Configuração

### Pré-requisitos

* Java 17 ou superior
* MySQL instalado e em execução
* Maven

### Configuração do Banco de Dados

Crie um banco de dados no MySQL com o nome `spring_security_mysql`:

```sql
CREATE DATABASE spring_security_mysql;
```

Atualize o arquivo `src/main/resources/application.properties` com suas credenciais do MySQL:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/securitydb?createDatabaseIfNotExist=true
spring.datasource.username=seu_usuario
spring.datasource.password=sua_senha
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

### Executando a Aplicação

1. Clone o repositório:

   ```bash
   git clone https://github.com/Herysson/Spring-Security-MySQL.git
   cd Spring-Security-MySQL
   ```

2. Compile e execute o projeto:

   ```bash
   mvn spring-boot:run
   ```

3. Acesse a aplicação em: [http://localhost:8080/login](http://localhost:8080/login)

## 👤 Usuários de Teste

A classe `DataInitializer` cria automaticamente dois usuários ao iniciar a aplicação:

| Usuário | Senha  | Papel |
| ------- | ------ | ----- |
| admin   | 123456 | ADMIN |
| user    | 123456 | USER  |

## 🗺️ Rotas Disponíveis

* `/login`: Página de login
* `/index`: Página de boas-vindas após login
* `/adminpanel`: Painel administrativo (acesso restrito a `ADMIN`)
* `/logout`: Efetua logout e redireciona para a página de login

## 📁 Estrutura do Projeto

```
Spring-Security-MySQL/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/herysson/springsecuritymysql/
│   │   │       ├── config/
│   │   │       │   └── SecurityConfig.java
│   │   │       ├── controller/
│   │   │       │   ├── AdminController.java
│   │   │       │   └── HomeController.java
│   │   │       ├── entity/
│   │   │       │   └── User.java
│   │   │       ├── repository/
│   │   │       │   └── UserRepository.java
│   │   │       ├── service/
│   │   │       │   └── CustomUserDetailsService.java
│   │   │       ├── DataInitializer.java
│   │   │       └── SpringSecurityMySqlApplication.java
│   │   └── resources/
│   │       ├── templates/
│   │       │   ├── login.html
│   │       │   ├── index.html
│   │       │   └── adminpanel.html
│   │       └── application.properties
├── pom.xml
└── README.md
```

## 📝 Observações

* As senhas são criptografadas utilizando o algoritmo BCrypt.
* O controle de acesso é baseado em papéis definidos no banco de dados.
* O projeto utiliza Thymeleaf para renderização das páginas HTML.

## 📸 Capturas de Tela

![image](https://github.com/user-attachments/assets/d4e9b7ac-4ec4-443a-982d-ec62c98043d7)
![image](https://github.com/user-attachments/assets/6e98428b-6386-4d6e-a3d4-9c02af7d5f50)
![image](https://github.com/user-attachments/assets/494c07a4-c966-48d3-9065-7b021eb88ae6)


## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
