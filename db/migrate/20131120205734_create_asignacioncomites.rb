class CreateAsignacioncomites < ActiveRecord::Migration
  def change
    create_table :asignacioncomites do |t|
      t.string :nombres
      t.string :apellidos
      t.references  :programa
      t.string :ficha
      t.string :fecha
      t.references :estado

      t.timestamps
    end
    add_index :asignacioncomites, :estado_id
    add_index :asignacioncomites, :programa_id
  end
end
