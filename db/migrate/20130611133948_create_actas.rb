class CreateActas < ActiveRecord::Migration
  def change
    create_table :actas do |t|
      t.string :fecha
      t.string :hora_inicio
      t.string :hora_terminacion
      t.string :objetivo_de_la_reunion
      t.text :desarrollo_reunion
      t.text :conclusiones
      t.references :comite

      t.timestamps
    end
    add_index :actas, :comite_id
  end
end
