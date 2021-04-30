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
      allow(Faraday).to receive(:get).and_return(response)
      @id = 12
      @sigla = 'AC'
      @nome = 'Acre'
      @dados = IbgeEstados.estados_all
      expect(@dados).to eq([[12, 'AC', 'Acre']])
      expect(@dados).not_to eq([[1, 'N', 'Norte']])
    end
  end
  it 'and return status,ok' do
    @response_body = [{ "id": 12, "sigla": 'AC', "nome": 'Acre',
                        "regiao": { "id": 1, "sigla": 'N', "nome": 'Norte' } }]
    response = class_double('response', body: @response_body, status: 200)
    allow(Faraday).to receive(:get).and_return(response)
    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end
end
