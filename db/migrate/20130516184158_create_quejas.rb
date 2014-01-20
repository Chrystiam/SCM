class CreateQuejas < ActiveRecord::Migration
  def change
    create_table :quejas do |t|
      t.string :fechainforme
      t.string :nombres
      t.string :apellidos
      t.references :tipo_documento
      t.string :identificacion
      t.string :telefono
      t.string :email
      t.references :programa
      t.string :ficha
      t.text :descripcion
      t.references :falta
      t.text :testigos
      t.text :nombreinfor
      t.string :cargo
      t.references :coordinador
      t.references :estado
      t.integer :userid




      t.timestamps
    end
    add_index :quejas, :estado_id
    add_index :quejas, :tipo_documento_id
    add_index :quejas, :programa_id
    add_index :quejas, :falta_id
    add_index :quejas, :coordinador_id
  end
end
