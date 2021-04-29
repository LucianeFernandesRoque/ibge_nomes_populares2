require 'sqlite3'
require 'faraday'
require 'json'


class IbgeEstados
  attr_accessor :id, :sigla, :nome

  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
      @dados = dados[:id], dados[:sigla], dados[:nome] 
    end
  end

  def self.table_estado
    @rows = []
    @table = Terminal::Table.new rows: @rows
    @table = Terminal::Table.new title: 'Estados', headings: %w[Id Estado UF], rows: estados_all
  end

  #--------------------------------------------DB-------------------------------------------------------------------------
  #def self.all
    #db = SQLite3::Database.open 'ibge_nomes.db'
    #db.results_as_hash = true
    #estados = db.execute "SELECT id, sigla, nome FROM estados"
    #db.close
    #estados.map {|estado| new(id: estado['id'],sigla: estado['sigla'],nome: estado['nome'])}
  #end

  #def save_to_db
    #db = SQLite3::Database.open "ibge_nomes.db"
    #db.execute "INSERT INTO estados VALUES('#{ id }', '#{ sigla }','#{ nome }')"
    #db.close
    #self
  #end
end
