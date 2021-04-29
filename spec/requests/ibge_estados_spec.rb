require 'spec_helper'
require 'ibge_estados'
require 'faraday'
require 'json'

RSpec.describe 'IbgeEstados' do
  it 'estados_all methods' do
    @response_body = [{ "id": 12, "sigla": 'AC', "nome": 'Acre', "regiao": { "id": 1, "sigla": 'N', "nome": 'Norte' }}]
    allow(Faraday).to receive(:post).and_receive(@response_body)
    id = 12
    sigla = 'AC'
    nome = 'Acre'
    @dados = IbgeEstados.estados_all
    expect(@dados).to eq(id, sigla, nome)
  end
end