class AddAcaoToRegistro < ActiveRecord::Migration[5.2]
  def change
    add_column :registros, :acao, :string
  end
end
