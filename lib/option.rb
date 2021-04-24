module Options

  VIEW_STATES = 1
  VIEW_CITIES = 2
  INSERT_NOMES = 3
  EXIT = 4

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

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end
  
  def invalid_option
    puts 'Opção incorreta'
  end

  def clear
    system('clear')
  end


end
