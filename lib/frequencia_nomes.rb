require 'sqlite3'
require 'colorize'
require 'terminal-table'
require_relative 'ibge_estados'
require_relative 'ibge_cidades'
require 'faraday'
require 'json'

class FrequenciaNomes
  attr_accessor :nome, :frequencia, :periodo

  def initialize=(nome, frequencia, periodo, decadas)
  @nome = nome
  @decadas = decadas
  @frequencia = frequencia
  @periodo = periodo
  end

  def self.frequencia_decadas
    nome = $stdin.gets
    req = nome.split(',').join('%7C')
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{req}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |decadas|
      @decadas = decadas[:res].map do |frequencia|
      @frequencia = decadas[:nome], frequencia[:frequencia], frequencia[:periodo]
    end
    end
  end
end
