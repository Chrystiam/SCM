class AddEstadoToProgramas < ActiveRecord::Migration
  def change
    add_column :programas, :estado, :boolean
  end
end
