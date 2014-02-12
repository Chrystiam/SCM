class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :descripcion
      t.string :abreviatura
      t.references :coordinador
      
      t.timestamps
    end
    add_index :programas, :coordinador_id
  end
end
