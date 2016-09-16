require "rails_helper"

RSpec.describe CasoMailer, type: :mailer do

   let(:user) { FactoryGirl.create(:user) }
   let(:mail) { described_class.feed_de_casos(user, atualizacao).deliver_now }
   let(:atualizacao) {
    {
        date: Time.new(2016,9,16).strftime("%d/%m/%Y"),
        casos: [
            {
                id: 42,
                nome_cliente: 'Fulano',
                processos_update: [
                    {
                        processo_id: 7,
                        diario_oficial: 'STF',
                        secao: 'III - Avisos',
                        atualizacao: 'HueHueHue'
                    },
                    {
                        processo_id: 13,
                        diario_oficial: 'DOM - SP',
                        secao: 'II - Capital',
                        atualizacao: 'Kkkkkkkkk'
                    }
                ]
            },
            {
                id: 1789,
                nome_cliente: 'Gubi',
                processos_update: [
                    {
                        processo_id: 713,
                        diario_oficial: 'DOM - SP',
                        secao: 'III - Avisos',
                        atualizacao: 'HueHueHueBRBRBRBR'
                    }
                ]
            }
        ]
    }
   }

   it 'renders the subject' do
     expect(mail.subject).to eq('Intimações do dia ' \
                                + Time.now.strftime("%d/%m/%Y"))
   end

   it 'renders the receiver email' do
     expect(mail.to).to eq([user.email])
   end

   it 'renders the sender email' do
     expect(mail.from).to eq(['noreplyparajas@gmail.com'])
   end

   it 'renders the atualizacao date' do
    expect(mail.body.encoded).to match("16/09/2016")
   end

   it 'renders the caso id' do
     expect(mail.body.encoded).to match("42")
     expect(mail.body.encoded).to match("1789")
   end

   it 'renders the cliente name' do
     expect(mail.body.encoded).to match("Fulano")
     expect(mail.body.encoded).to match("Gubi")
   end

   it 'renders the processo ids' do
     expect(mail.body.encoded).to match("7")
     expect(mail.body.encoded).to match("13")
     expect(mail.body.encoded).to match("713")
   end

   it 'renders the diario oficial' do
     expect(mail.body.encoded).to match("STF")
     expect(mail.body.encoded).to match("DOM - SP")
   end

   it 'renders the secao' do
     expect(mail.body.encoded).to match("III - Avisos")
     expect(mail.body.encoded).to match("II - Capital")
   end

   it 'renders the atualizacao' do
     expect(mail.body.encoded).to match("HueHueHueBRBRBRBR")
   end
end
