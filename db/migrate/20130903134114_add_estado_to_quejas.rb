class AddEstadoToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :estado, :boolean
  end
end
