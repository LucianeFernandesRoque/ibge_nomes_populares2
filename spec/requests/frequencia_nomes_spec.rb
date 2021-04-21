require 'faraday'
require 'frequencia_nomes'
require 'spec_helper'
require 'json'

describe 'FrequenciaNomes' do
  context 'api validates' do
    it 'validate status' do
      response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')

      expect(response.status).to eq(200)
      expect(response.status).not_to eq(404)
    end
  end

  it 'cant not return null' do
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
    expect(response.body).to_not be_nil
  end
end
