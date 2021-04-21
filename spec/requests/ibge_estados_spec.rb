require 'faraday'
require 'ibge_estados'
require 'json'
require 'spec_helper'

describe 'IbgeEstados' do
  context 'api validates' do
    it 'validate status' do
      response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')

      expect(response.status).to eq(200)
      expect(response.status).not_to eq(404)
    end
  end

  it 'cant not return null' do
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    expect(response.body).not_to be_nil
  end
end
