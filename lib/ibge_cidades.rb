class IbgeCidades
  attr_accessor :id, :sigla, :nome

  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.cidades_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    @cidades = cidades[:id], cidades[:nome], cidades[:microrregiao][:mesorregiao][:UF][:id]
    end
  end

  def self.table_cidades_all
    @rows = []
    @table = Terminal::Table.new rows: @rows
    @table = Terminal::Table.new title: 'Cidades', headings: %w[Id Cidade Digito_uf], rows: cidades_all
  end
end