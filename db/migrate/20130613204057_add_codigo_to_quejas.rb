class AddCodigoToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :codigo, :string
  end
end
