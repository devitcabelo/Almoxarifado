class Material < ApplicationRecord
    belongs_to :material_quantidades

    def to_s
        self.nome
    end
end
