# Recapítulo Aula Passada
## Fluxo de Processo Requisição

Pessoa faz uma requisição através de um http:// --->

Servidor recebe a requisição, vai para controller --->

Controller cria Model --->

Model retorna para Controller --->
model cria as entidades no banco de dados
cada model tem seu controler

Controller retorna para Servidor --->

Servidor constrói um HTML e retonar para Pessoa (parte da VIEW)

## Fluxo de Processo Cadastro

- Pessoa ->
- Dados ->
- "/produto/salvar" (html)->
- controller ->
- model ->
- controller ->
- repository ->
- banco de dados ->
- repository ->
- controller ->
- servidor ->
- resultado p/ pessoa (html)

## Fluxo de Processo Listar

- Pessoa (requisição)->
- Servidor ->
- Controller ->
- Repository ->
- Banco de dados ->
- Repository ->
- Model ->
- Repository->
- Controller ->
- Servidor ->
- Pessoa (html)
