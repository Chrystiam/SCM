class AddEstadoToFichas < ActiveRecord::Migration
  def change
    add_column :fichas, :estado, :boolean
  end
end
