class CreateActas < ActiveRecord::Migration
  def change
    create_table :actas do |t|
      t.string :ciudad
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_terminacion
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
