require 'io/console'
require_relative 'ibge_estados'
require_relative 'ibge_cidades'
require_relative 'ranking_nomes'
require_relative 'frequencia_nomes'
require 'terminal-table'
require 'colorize'
require 'json'

VIEW_STATES = 1
VIEW_CITIES = 2
INSERT_NOMES = 3
EXIT = 4

def welcome
  'Bem vindo ao sistema nomes mais comuns do Brasil'
end

def menu
  puts '->->->->->->->->->M E N U ->->->->->->->->->->'.blue
  puts "[#{VIEW_STATES}]Escolha a UF que deseja visualizar o ranking dos nomes mais comuns"
  puts "[#{VIEW_CITIES}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
  puts "[#{INSERT_NOMES}] Digite um ou mais nomes(separando por vírgula)para consultar a frequência de um nome ao longo dos anos"
  puts "[#{EXIT}] Sair"
  puts '->->->->->->->->->->->->->->->->->->->->->->->'.blue

  print 'Escolha uma opção: '
  gets.to_i
end

def clear
  system('clear')
end

def wait_and_clear
  wait_keypress
  clear
end

clear
puts welcome
option = menu

while option != 4
  if  option == VIEW_STATES
    puts IbgeEstados.table_estado
    puts RankingNomes.table_nomes
    break
  elsif option == VIEW_CITIES
    puts IbgeCidades.table_cidades_all
    puts RankingNomes.table_nomes
    break
  elsif option == INSERT_NOMES
    puts FrequenciaNomes.table_decadas
  break
  end
end
