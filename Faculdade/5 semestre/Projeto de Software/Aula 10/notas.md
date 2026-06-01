# Spring Security

https://github.com/Herysson/Projeto-de-Software/blob/main/Aula%2015%20-%20Introdu%C3%A7%C3%A3o%20ao%20Spring%20Security%20com%20MySQL.md

repository -> implements UserDetailsSerive (classe do JPA)
- ensina o spring security em como ele deve achar o usuario no banco de dados
- comparação de hash de senhas; senha de quem esta requisitando e senha salva no banco(criptografada) são iguais?


---

classe SecurityConfig -> principal classe de configuração de sistema
- @Configuration (ela já existe, estamos reescrevendo-a)
- @EnableWebSecurity
- Filtro de seguraça -> três etapas:
	1) configura autorização para diferentes URLs, 
		- acesso público (sem autenticação) -> permitAll()
		- acesso autorizado -> .hasAuthority("ADMIN")
	2) configura o formulario de login, é implementado automaticamente; configurar meu formulario de login personlizado
	3) configura logout

Definir o Encoder de senha para criptografar e verificar  
Configurar provedor de autenticação, utiliza UserDetailsService

meio que tudo isso é padrão, tu faz uma vez e copia e cola

---

DataInitializer, toda vez que aplicação é rodada ela é inicializada
