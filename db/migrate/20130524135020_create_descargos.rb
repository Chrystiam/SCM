class CreateDescargos < ActiveRecord::Migration
  def change
    create_table :descargos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
