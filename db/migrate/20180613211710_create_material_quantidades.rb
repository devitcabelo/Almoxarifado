class CreateMaterialQuantidades < ActiveRecord::Migration[5.2]
  def change
    create_table :material_quantidades do |t|
      t.references :material, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
