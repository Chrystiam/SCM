class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :descripcion
      t.string :abreviatura
      t.references :coordinadora
      t.references :centro

      t.timestamps
    end
    add_index :programas, :centro_id
    add_index :programas, :coordinadora_id
  end
end
