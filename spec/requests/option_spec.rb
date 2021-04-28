require 'spec_helper'

RSpec.describe Options do
  it 'metodo welcome' do
    Options.welcome =  puts Options
      
    expect(Options).to eq 'Bem vindo ao sistema nomes mais comuns do Brasil'
end
end
