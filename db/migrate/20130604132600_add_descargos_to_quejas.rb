class AddDescargosToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :descargos, :text
  end
end
