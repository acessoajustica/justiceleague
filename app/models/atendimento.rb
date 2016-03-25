class Atendimento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  belongs_to :atendimento_type
  belongs_to :atendimento_resultado

  default_scope { order(created_at: :asc) }

  validates :initial_description,
            presence: true,
            allow_blank: false

  #TODO quebra os testes...
  #validates :cliente, presence: true

  def self.all_for (user)
    where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end

=begin
  def self.from_beginning_of_day
    atendimentos = self.where("created_at >= ?", Time.zone.now.beginning_of_day).select do |atendimento|
      atendimento.status == true and atendimento.estagiario == nil
    end
    atendimentos
  end
=end

  def self.from_beginning_of_day
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.waiting_list
    self.from_beginning_of_day
    .where("status = true")
    .where("estagiario_id is NULL")
  end

  def type_description
    if (atendimento_type)
      atendimento_type.description
    end
  end

  def canTakeMe?(estagiario)
    intersection = atendimento_type.especialidades & estagiario.especialidades
    intersection.any?
  end

  def status_name
    if self.status
      'Aprovado'
    else
      'Não aprovado'
    end
  end

end
