require 'faraday'
require 'ibge_cidades'
require 'spec_helper'
require 'json'
require byebug

describe 'IbgeCidades' do
  context 'api validates' do
    it 'validate status' do
      response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
      expect(response.status).to eq(200)
      expect(response.status).not_to eq(404)
    end
  end

  it 'cant not return null' do
    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
    expect(response.body).not_to be_nil
  end

  it 'return the last params' do
    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
    expect(response.body)
  end
end
