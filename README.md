# Ibge nomes populares
Este projeto tem como objetivo realizar uma versão old school do app que IBGE lançou uma aplicação Web
(https://www.ibge.gov.br/censo2010/apps/nomes), que traz um ranking interativo dos nomes
mais populares que pode ser organizado em décadas e/ou estados do país. Além disso
você pode buscar pelo seu nome e entender quão frequente é esse nome em um estado ou
uma cidade do país.


## Funcionalidades
# Desafio 2
Nesta etapa, queremos otimizar nossa aplicação. As UFs e as cidades do país raramente
sofrem alterações, então não faz muito sentido consultar a API de localidades várias vezes
para exibir o resultado.
1. Criar uma estrutura de conexão a um banco de dados em sua aplicação. Você pode
usar SQLite para simplificar a vida.
2. Ao iniciar sua aplicação pela primeira vez, você deve criar e popular tabelas para
armazenar todas as UFs e todos os municípios, consultando a API de localidades.
Lembre-se de armazenar somente os dados essenciais para o uso dentro da sua
aplicação.
3. Ao realizar as operações que demandam o uso de códigos de UFs e/ou cidades,
utilizar os dados vindos do banco de dados ao invés da API de localidades.


## Getting Started

Essas instruções fornecerão uma cópia do projeto instalado e funcionando em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos
Máquina com sistema operacional Linux ( ou Windows Subsystem for Linux e similares) com chave SSH configurada, e Ruby 2.7.2.

### Instalação
*  Em seu terminal, digite:
  `$ git@github.com:LucianeFernandesRoque/      ibge_nomes_populares_com_bd.git`
*  Após clonar, execute:
  `$ bundle install`
*  Execute:
  `$ bin/setup`

## Executando testes
*  Para executar os testes de funcionalidades, execute no terminal: 
  `$ rspec`
*  Para testes de boas práticas e convenções de código, execute no terminal: 
  `$ rubocop`

*  Para testes de REQUEST (API), execute no terminal: 
  `$ rspec ./spec/requests/ibge_dados_spec.rb`
  `$ rspec ./spec/requests/ranking_nomes_spec.rb`
## Dados da api em contrução

### Author
*  Luciane Fernandes Roque
