require_relative 'option'
require_relative 'frequencia_nomes'
require_relative 'ibge_cidades'
require_relative 'ibge_estados'
require_relative 'ranking_nomes'
include Options

option = Options.menu

case option
when VIEW_STATES
  puts IbgeEstados.table_estado
  puts RankingNomes.table_nomes
when VIEW_CITIES
  puts IbgeCidades.table_cidades_all
  puts RankingNomes.table_nomes
when INSERT_NOMES
  puts FrequenciaNomes.frequencia_decadas
else
  invalid_option
end
