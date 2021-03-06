require 'spec_helper'
require 'faraday'
require 'json'
require 'ranking_nomes'
require 'ibge_cidades'
describe 'RankingNomes' do
  context 'return response' do
    it 'nomes_all methods' do
      response = [
        {
          "localidade": '17',
          "sexo": 'F',
          "res": [{
            "nome": 'MARIA',
            "frequencia": 11734129,
            "ranking": 1
          }]
        }
      ]
      localidade = 17
      sexo = "F"
      sent_response = class_double('sent_resp', body: response.to_json, status: 200)
      url = "https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=#{sexo}&localidade=#{localidade}"
      allow(Faraday).to receive(:get).with(url).and_return(sent_response)
      @nomes = RankingNomes.nomes_all
      expect(@nomes).to eq([[['MARIA', 1, 11734129]]])
      expect(@nomes).not_to eq([['Joao', 1515, 10]])
    end
  end
end
