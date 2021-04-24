require 'sqlite3'
class IbgeEstados
  attr_accessor :id, :sigla, :nome

  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.estados_all
    db = SQLite3::Database.open "db/database.db"
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    db.results_as_hash = true
      db.execute "SELECT id, sigla, nome FROM estados"
      db.close
      estados.map {|estados| new(id: estados['id'], sigla: estados['sigla'], nome: estados['nome']) }
      @dados = dados[:id], dados[:sigla], dados[:nome]
    end
  end

  def save_to_db
    db = SQLite3::Database.open "db/database.db"
    db.execute "INSERT INTO estados VALUES('#{ id }', '#{ sigla }','#{ nome }')"
    db.close
    self
  end

  def self.table_estado
    @rows = []
    @table = Terminal::Table.new rows: @rows
    @table = Terminal::Table.new title: 'Estados', headings: %w[Id Estado UF], rows: estados_all
  end


end
