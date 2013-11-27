class CreateAsignacioncomites < ActiveRecord::Migration
  def change
    create_table :asignacioncomites do |t|
      t.string :nombres
      t.string :apellidos
      t.string :programa
      t.string :ficha

      t.timestamps
    end
  end
end
