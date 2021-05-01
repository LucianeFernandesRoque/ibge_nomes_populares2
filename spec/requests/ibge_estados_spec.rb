require 'spec_helper'
require 'json'
require 'ibge_estados'
require 'webmock/rspec'

RSpec.describe 'IbgeEstados' do
  context 'api validates' do
    it 'estados_all methods' do
      response = [{
        "id": 12,
        "sigla": 'AC',
        "nome": 'Acre',
        "regiao": {
          "id": 1,
          "sigla": 'N',
          "nome": 'Norte'
        }
      }]
      @id = 12
      @sigla = 'AC'
      @nome = 'Acre'

      stub_request(:get, 'https://servicodados.ibge.gov.br/api/v1/localidades/estados')
        .with(query: { OrderBy: @nome })
        .to_return(status: 200, body: response.to_json, headers: {})

      @dados = IbgeEstados.estados_all
      expect(@dados).to eq([[12, 'AC', 'Acre']])
      expect(@dados).not_to eq([[1, 'N', 'Norte']])
    end
  end
end
