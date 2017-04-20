# Preview all emails at http://localhost:3000/rails/mailers/caso_mailer
class CasoMailerPreview < ActionMailer::Preview
  def test
  	@user = User.new
    @user.email = "noreplyparajas@gmail.com"
    @user.id = 123456789
  	@atualizacao =
    {
      date: Time.new(2016,9,16).strftime("%d/%m/%Y"),
      casos: [
          {
              id: 42,
              nome_cliente: 'Fulano',
              processos_update: [
                  {
                    processo_id: 1,
                    processo_numero: "0011953-02.2016.8.26.0001",
                    diario_oficial: 'TJ-SP',
                    caderno: 'Judicial - 1ª Instância - Capital',
                    secao: 'Fóruns Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi Cível 4ª Vara da Família e Sucessões',
                    pagina: 1899,
                    atualizacao: 
                      'Processo 0011953-02.2016.8.26.0001 (processo principal 0027902-08.2012.8.26) - Cumprimento de sentença - Revisão - Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de satisfação de verba alimentar, dotada de peculiaridades prestações continuadas, com períodos e ritos diversos - e visando inclusive o célere processamento, proceda o interessado à distribuição de execução autônoma por dependência a este Juízo. Int. - ADV: LEANDRO ANDRÉ FRANCISCO LIMA (OAB 183134/SP), FERNANDO MANGIANELLI BEZZI (OAB 299878/SP), CAMILA MOURA (OAB 299825/SP)'
                  },
              ]
          },
          {
              id: 1789,
              nome_cliente: 'Goldman',
              processos_update: [
                  {
                    processo_id: 7,
                    processo_numero: "346/2016",
                    diario_oficial: 'DOM-SP',
                    caderno: 'Normal',
                    secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                    pagina: 50,
                    atualizacao: 
                      'Aviso de 29-7-2016 Nº 346/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Nor- mativo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de AGOSTO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 3, 10, 17, 24 E 31: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes (Republicada por necessidade de retificação ? doe de 30-07-2016)'
                  },
                  {
                    processo_id: 13,
                    processo_numero: "389/2016",
                    diario_oficial: 'DOM-SP',
                    caderno: 'Normal',
                    secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                    pagina: 57,
                    atualizacao: 
                      'Aviso de 1-9-2016 nº 389/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Norma- tivo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de SETEMBRO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 14, 21 E 28: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes'
                  }
              ]
          }
      ]
    }

    CasoMailer.feed_de_casos(@user, @atualizacao)
    #EmailTestJob.new(@user, @atualizacao).perform_now
  end
end
