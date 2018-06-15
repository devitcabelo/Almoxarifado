class Registro < ApplicationRecord
  belongs_to :usuario
  belongs_to :material
  
end