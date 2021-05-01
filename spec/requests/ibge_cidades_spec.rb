require 'spec_helper'
require 'ibge_cidades'
require 'json'

RSpec.describe 'IbgeCidades' do
  context 'return response' do
    it 'cidades_all methods' do
      response = [
        {
          "id": 5_200_050,
          "nome": 'Abadia de Goiás',
          "microrregiao": {
            "id": 52_010,
            "nome": 'Goiânia',
            "mesorregiao": {
              "id": 5203,
              "nome": 'Centro Goiano',
              "UF": {
                "id": 52,
                "sigla": 'GO',
                "nome": 'Goiás',
                "regiao": {
                  "id": 5,
                  "sigla": 'CO',
                  "nome": 'Centro-Oeste'
                }
              }
            }
          }
        }
      ]
      sent_response = class_double('sent_resp', body: response.to_json, status: 200)
      url = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
      allow(Faraday).to receive(:get).with(url).and_return(sent_response)
      @cidades = IbgeCidades.cidades_all
      expect(@cidades).to eq([[5_200_050, 'Abadia de Goiás', 52]])
      expect(@cidades).not_to eq([[5, 'CO', 5203]])
    end
  end
end
