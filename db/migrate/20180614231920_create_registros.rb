class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.references :usuario, foreign_key: true
      t.references :material, foreign_key: true
      t.integer :quantidade
    end
  end
end
