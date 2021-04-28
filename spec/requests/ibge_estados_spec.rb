require 'spec_helper'
require 'ibge_estados'

RSpec.describe IbgeEstados do
  IbgeEstados.estados_all
  expect(estados_all).to()
end
