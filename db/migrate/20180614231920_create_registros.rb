class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.references :usuarios, foreign_key: true
      t.references :materiais, foreign_key: true
      t.integer :quantidade
    end
  end
end
