class AddTelefonoToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :telefono, :string
  end
end
