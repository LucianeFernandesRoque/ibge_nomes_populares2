require 'spec_helper'
require 'ibge_estados'
require 'faraday'
require 'json'

RSpec.describe 'IbgeEstados' do
  it 'estados_all methods' do
    
    @response_body = [{ "id": 12, "sigla": 'AC', "nome": 'Acre', "regiao": { "id": 1, "sigla": 'N', "nome": 'Norte' }}]
    resp = class_double('response_body', status: 200)
    Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')


    allow(@response_body).to receive(:get).with(Faraday).and_return(@response_body)
    id = 12
    sigla = 'AC'
    nome = 'Acre'
    @dados = IbgeEstados.estados_all
    expect(@dados).to eq([id, sigla, nome])
  end
end