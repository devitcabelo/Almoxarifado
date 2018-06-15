class MaterialQuantidade < ApplicationRecord
  #RELATIONS
  belongs_to :material

  #VALIDATION
  validates :quantidade, numericality: { only_integer: true }
  validates :material_id, uniqueness: true

  validate :quantidade_maior_ou_igual_a_zero

  #CUSTOM METHODS
  def quantidade_maior_ou_igual_a_zero
    if quantidade.present? && quantidade < 0
      errors.add(:quantidade, "retirada não pode ser maior que a presente deste material.")
    end
  end

  def nova_quantidade acao, quantidade
    quantidade_atual = self.quantidade
    if acao.eql?("entrada")
      quantidade_atual += quantidade
    elsif acao.eql?("retirada")
      quantidade_atual -= quantidade
    end
    quantidade_atual
  end

  def self.pode_retirar
    agora = Time.now
    dia_da_semana = agora.wday # 0 = Domingo
    hora_atual = agora.to_formatted_s(:time)
    "09:00" < hora_atual && hora_atual < "18:00" && ([0,6].exclude?(Time.now.wday)) # 0 = Domingo, 6 = Sábado
  end
end
