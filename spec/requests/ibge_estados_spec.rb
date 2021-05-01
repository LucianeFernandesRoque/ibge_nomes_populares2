require 'spec_helper'
require 'json'
require 'ibge_estados'
RSpec.describe 'IbgeEstados' do
  it 'estados_all methods' do
    response = [
      {
        "id": 12,
        "sigla": 'AC',
        "nome": 'Acre',
        "regiao": {
          "id": 1,
          "sigla": 'N',
          "nome": 'Norte'
        }
      }
    ]

    sent_response = class_double('sent_resp', body: response.to_json, status: 200)
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'
    allow(Faraday).to receive(:get).with(url).and_return(sent_response)
    @dados = IbgeEstados.estados_all
    expect(@dados).to eq([[12, 'AC', 'Acre']])
    expect(@dados).not_to eq([[1, 'N', 'Norte']])
  end
end
