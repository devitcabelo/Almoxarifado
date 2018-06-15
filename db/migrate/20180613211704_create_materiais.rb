class CreateMateriais < ActiveRecord::Migration[5.2]
  def change
    create_table :materiais do |t|
      t.string :nome

      t.timestamps
    end
  end
end
