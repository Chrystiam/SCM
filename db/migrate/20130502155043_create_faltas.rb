class CreateFaltas < ActiveRecord::Migration
  def change
    create_table :faltas do |t|
      t.string :falta
      t.string :descripcion

      t.timestamps
    end
  end
end
