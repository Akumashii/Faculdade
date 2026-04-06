# DELETE CRUD

Sequência:
- Pessoa (view) (requisição, /produto/deletar/id ) ->
- Servidor ->
- Controller ->
- Repository ->
- Database ->
- Repository ->
- Controller -> (Redirect: produto/listar)
- Servidor ->
- Pessoa (view) (<html>) ->

# UPDATE CRUD

Sequência:
- Busca
  1) Pessoa (view) (requisição, /produto/editar/id ) ->
	2) Servidor ->
	3) Controller ->
	4) Model ->
	5) Repository ->
	6) Database ->
	7) Repository ->
	8) Model ->
	9) Controller -> (form objeto)
	10) Servidor ->
	11) Pessoa (view) (<html>) -> (salvar)
- Salvar
	1) Servidor ->
	2) Controller ->
	3) Model ->
	4) Controller ->
	5) Repository ->
	6) Database ->
	7) Repository ->
	8) Controller ->
	9) Servidor ->
	10) Pessoa (view)


# revisão

model -> estrutura de dados, armazena dados
controller -> gerencia o fluxo da aplicação, atua como intermediário entre usuário e model/view
repository -> camada entre a **lógica de negócios de uma aplicação** (Model/Service) e **banco de dados** (Database), fala com o banco de dados

# Camada de Serviço

Intermediário entre model, controller e repository.

