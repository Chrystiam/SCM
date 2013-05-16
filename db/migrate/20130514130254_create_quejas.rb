class CreateQuejas < ActiveRecord::Migration
  def change
    create_table :quejas do |t|
      t.date :fechainforme
      t.string :nombres
      t.string :apellidos
      t.references :tipo_documento
      t.string :programa
      t.string :ficha
      t.text :descripcion
      t.references :falta
      t.text :testigos
      t.string :nombresinformante
      t.string :apellidosinformante
      t.string :direccion
      t.string :cargo

      t.timestamps
    end
    add_index :quejas, :tipo_documento_id
    add_index :quejas, :falta_id
  end
end
