require 'spec_helper'
require 'ibge_estados'
require 'faraday'
require 'json'

RSpec.describe 'IbgeEstados' do
  context 'api validates' do
    it 'estados_all methods' do
      @response_body = [{ "id": 12, "sigla": 'AC', "nome": 'Acre',
                          "regiao": { "id": 1, "sigla": 'N', "nome": 'Norte' } }]
      response = class_double('response', body: @response_body, status: 200)
      url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'
      allow(Faraday).to receive(:get).and_return(response)
      id = 12
      sigla = 'AC'
      nome = 'Acre'
      @dados = IbgeEstados.estados_all
      expect(@dados).to eq([[12, 'AC', 'Acre']])
    end
  end
end
