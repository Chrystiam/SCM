class CreateQuejas < ActiveRecord::Migration
  def change
    create_table :quejas do |t|
      t.string :nombres
      t.string :apellidos
      t.references :tipo_documento
      t.string :identificacion
      t.string :telefono
      t.string :email
      t.references :programa
      t.text :descripcion
      t.references :falta
      t.references :calificacionf
      t.string :testigos
      t.string :nombresinformante
      t.string :apellidosinformante
      t.string :direccioninformante
      t.string :telefonoinf
      t.references :cargo
      t.text :descargos
      t.references :ficha
      t.references :centro


      t.timestamps
    end
    add_index :quejas, :tipo_documento_id
    add_index :quejas, :programa_id
    add_index :quejas, :falta_id
    add_index :quejas, :cargo_id
    add_index :quejas, :ficha_id
    add_index :quejas, :centro_id
  end
end
