class CreateActas < ActiveRecord::Migration
  def change
    create_table :actas do |t|
      t.string :ciudad
      t.string :fecha
      t.string :hora_inicio
      t.string :hora_terminacion
      t.string :lugar
      t.string :tema
      t.string :objetivo_de_la_reunion
      t.text :desarrollo_reunion
      t.text :conclusiones
      t.string :firmas

      t.timestamps
    end
  end
end
