class Material < ApplicationRecord
  #RELATIONS
  has_one :material_quantidade
  has_many :registros

  #VALIDATIONS
  validates :nome, uniqueness: true

  #DELEGATES
  delegate :quantidade, to: :material_quantidade

  
  def to_s
    self.nome
  end
end
