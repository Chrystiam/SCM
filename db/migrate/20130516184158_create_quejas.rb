class CreateQuejas < ActiveRecord::Migration
  def change
    create_table :quejas do |t|
      t.date :fechainforme
      t.string :nombres
      t.string :apellidos
      t.references :tipo_documento
      t.string :identificacion
      t.string :telefono
      t.string :email
      t.references :programa
      t.text :descripcion
      t.references :falta
      t.string :testigos
      t.string :nombresinformante
      t.string :apellidosinformante
      t.string :direccioninformante
      t.references :cargo
      t.text :descargos
      t.references :ficha


      t.timestamps
    end
    add_index :quejas, :tipo_documento_id
    add_index :quejas, :programa_id
    add_index :quejas, :falta_id
    add_index :quejas, :cargo_id
    add_index :quejas, :ficha_id
  end
end
