class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :descripcion
      t.string :abreviatura
      t.string :ficha
      t.references :centro

      t.timestamps
    end
    add_index :programas, :centro_id
  end
end
