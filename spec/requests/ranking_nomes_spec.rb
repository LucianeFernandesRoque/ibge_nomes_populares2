require 'faraday'
require 'ibge_cidades'
require 'json'
require 'spec_helper'

describe 'RankingNomes' do
  context 'validação da api nomes' do
    it 'fazer uma requisão da apinomes e validar o status' do
      response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade?')

      expect(response.status).to eq(200)
      expect(response.status).not_to eq(404)
    end
  end

  it 'não pode retornar nulo' do
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade?')

    expect(response.body).not_to be_nil
  end
end
