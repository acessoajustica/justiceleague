# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

puts 'seeding...'

# Creating estado_civil's
EstadoCivil.find_or_create_by!(:description => "Solteiro")
EstadoCivil.find_or_create_by!(:description => "Casado")
EstadoCivil.find_or_create_by!(:description => "Separação de Fato")
EstadoCivil.find_or_create_by!(:description => "Separação Judicial")
EstadoCivil.find_or_create_by!(:description => "Viúvo")
EstadoCivil.find_or_create_by!(:description => "Vive em União Estável")

# Creating profissao's
ProfissaoType.find_or_create_by!(:description => "Registrado", :created_at => Time.now, :updated_at => Time.now)
ProfissaoType.find_or_create_by!(:description => "Informal", :created_at => Time.now, :updated_at => Time.now)
ProfissaoType.find_or_create_by!(:description => "Aposentado", :created_at => Time.now, :updated_at => Time.now)
ProfissaoType.find_or_create_by!(:description => "Desempregado", :created_at => Time.now, :updated_at => Time.now)
ProfissaoType.find_or_create_by!(:description => "Outro", :created_at => Time.now, :updated_at => Time.now)

# Creating atendimento_types
AtendimentoType.find_or_create_by!(:description => "Orientação Apenas")
AtendimentoType.find_or_create_by!(:description => "Orientação Cancelada")
AtendimentoType.find_or_create_by!(:description => "Mediação")
AtendimentoType.find_or_create_by!(:description => "Caso")

# Creating roles.
admin_role      = Role.find_or_create_by!(:name => "admin")
diretor_role    = Role.find_or_create_by!(:name => "diretor")
vareiro_role    = Role.find_or_create_by!(:name => "vareiro")
calouro_role    = Role.find_or_create_by!(:name => "calouro")
estagiario_role = Role.find_or_create_by!(:name => "estagiário")

admin_user = User.create!(:email=>'test@test.com',:username=>'admin',:password=>'password')
admin_user.roles << admin_role

# Creating moradia_types
MoradiaType.find_or_create_by!(:description => "Morador de Rua", :created_at => Time.now, :updated_at => Time.now)
MoradiaType.find_or_create_by!(:description => "Aluguel / Pensão", :created_at => Time.now, :updated_at => Time.now)
MoradiaType.find_or_create_by!(:description => "Moradia Irregular", :created_at => Time.now, :updated_at => Time.now)
MoradiaType.find_or_create_by!(:description => "Própria", :created_at => Time.now, :updated_at => Time.now)
MoradiaType.find_or_create_by!(:description => "Cedida" , :created_at => Time.now, :updated_at => Time.now)
MoradiaType.find_or_create_by!(:description => "Outra", :created_at => Time.now, :updated_at => Time.now)

#Creating especialidades
Especialidade.find_or_create_by!(:description => "Cível");
Especialidade.find_or_create_by!(:description => "Família");
Especialidade.find_or_create_by!(:description => "Penal");
Especialidade.find_or_create_by!(:description => "Previdenciário");
Especialidade.find_or_create_by!(:description => "Trabalhista");
Especialidade.find_or_create_by!(:description => "Tributário");
Especialidade.find_or_create_by!(:description => "N/D");


case Rails.env
 when "development"

    # Creating admin users
    estagiario_user = User.create!(:email=>'estagiario@test.com',:username=>'estagiario',:password=>'password')
    calouro_user    = User.create!(:email=>'calouro@test.com',:username=>'calouro',:password=>'password')
    vareiro_user    = User.create!(:email=>'vareiro@test.com',:username=>'vareiro',:password=>'password')
    diretor_user    = User.create!(:email=>'diretor@test.com',:username=>'diretor',:password=>'password')



    # assign the admin role to the admin user.  (This bit of rails
    # magic creates a user_role record in the database.)
    estagiario_user.roles << estagiario_role
    calouro_user.roles << calouro_role
    vareiro_user.roles << vareiro_role
    diretor_user.roles << diretor_role

    # Creating cliente
    cliente = Cliente.find_or_create_by!(:nome => "João da Silva",
              :cpf  => "123.456.789-00",
              :nome_da_mae => "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :profissao_nome  => "Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4,
              :aprovado => true)

    estagiario = Estagiario.create!(:nome => "Joana Silveira ",
                                               :cpf =>"123.456.789-00",
                                               :nome_da_mae  =>  "Maria da Penha",
                                               :rg  => "12.345.678-9",
                                               :cor  => "Negro",
                                               :identidade_de_genero  => "Homem",
                                               :ano_faculdade  => "2012")

    estagiario_user.membro_id = estagiario.membro.id
    estagiario_user.save

    estagiario_diretor = Estagiario.create!(:nome => "Joana Diretora",
              :cpf =>"123.456.789-01",
              :nome_da_mae  =>  "Maria Diretora",
              :rg  => "12.345.678-0",
              :cor  => "Negro",
              :identidade_de_genero  => "Mulher",
              :ano_faculdade  => "2006")

    diretor_user.membro_id = estagiario_diretor.membro.id
    diretor_user.save

    resultado_type = AtendimentoResultado.find_or_create_by!(:description => "Orientação")

    # Creating atendimento
    atendimento1 = Atendimento.find_or_create_by!(:status => true,
                                                  :cliente => cliente,
                                                  :initial_description => 'Relato inicial.')

    atendimento2 = Atendimento.find_or_create_by!(:status => false,
                                                  :cliente => cliente,
                                                  :initial_description => 'Relato inicial.')

    atendimento3 = Atendimento.find_or_create_by!(:status => true,
                                                  :cliente => cliente,
                                                  :initial_description => 'Relato inicial.',
                                                  :estagiario => estagiario,
                                                  :atendimento_resultado => resultado_type)



    cliente2 = Cliente.find_or_create_by!( :nome => "Abreu da Silva Sauro",
              :cpf  =>"123.456.789-00",
              :nome_da_mae => "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :profissao_nome  =>"Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4,
              :aprovado => true)

    # Creating atendimento
    atendimento4 = Atendimento.find_or_create_by!(:status => true,
                                                  :cliente => cliente2,
                                                  :initial_description => "Relato inicial.")
end
