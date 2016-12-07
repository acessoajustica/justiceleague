require 'rails_helper'

RSpec.describe Pessoa, type: :model do
    
  before :all do
    @pessoa = Pessoa.new(FactoryGirl.attributes_for(:pessoa))
  end

  it "has invalid name" do
    @pessoa.nome = nil
    expect(@pessoa).to_not be_valid
  end

end
