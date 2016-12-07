require 'rails_helper'

RSpec.describe Membro, type: :model do
  context 'We have a valid membro' do
    before :each do
      @valid_membro = FactoryGirl.create(:membro)
    end

    it 'has a valid nome' do
      expect(@valid_membro).to be_valid
    end
  end
  context 'We have an invalid membro' do
    before :each do
      @invalid_membro = FactoryGirl.create(:membro)
    end 

   it 'has an invalid nome' do
     @invalid_membro.nome = nil
     expect(@invalid_membro).to_not be_valid
   end

   it 'has an invalid cpf' do
     @invalid_membro.cpf = nil
     expect(@invalid_membro).to_not be_valid
   end

   it 'has an invalid nome_da_mae' do
     @invalid_membro.nome_da_mae = nil
     expect(@invalid_membro).to_not be_valid
   end

   it 'has an invalid rg' do
     @invalid_membro.rg = nil
     expect(@invalid_membro).to_not be_valid
   end

   it 'has an invalid cor' do
     @invalid_membro.cor = nil
     expect(@invalid_membro).to_not be_valid
   end

   it 'has an invalid identidade_de_genero' do
     @invalid_membro.identidade_de_genero = nil
     expect(@invalid_membro).to_not be_valid 
   end

   context 'has an invalid ano_faculdade' do
     it 'has not a numerical ano_faculdade' do
       @invalid_membro.ano_faculdade = "ABCDEF"
       expect(@invalid_membro).to_not be_valid
     end

     it 'has an ano_faculdade greater than current date' do
       @invalid_membro.ano_faculdade = 2100
       expect(@invalid_membro).to_not be_valid
     end

     it 'has an ano_faculdade lesser than 1900' do
       @invalid_membro.ano_faculdade = 1800
       expect(@invalid_membro).to_not be_valid
     end
   end 
  end
end
