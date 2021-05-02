require 'spec_helper'
require 'json'
require 'faraday'
require 'frequencia_nomes'
RSpec.describe 'FrequenciaNomes' do
  context 'return_response' do
    it 'frequencia_decadas methods' do
      response = [
        {
          "nome": 'MARIA',
          "sexo": 'null',
          "localidade": 'BR',
          "res": {
            "periodo": '1930[',
            "frequencia": 336_477
          }
        }
      ]
      sent_response = class_double('sent_resp', body: response.to_json, status: 200)
      url = 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/Maria'
      allow(Faraday).to receive(:get).with(url).and_return(sent_response)
      @frequencia = FrequenciaNomes.frequencia_decadas

      expect(@frequencia).to eq([['Maria', 336477, '1930']])
    end
  end
end
