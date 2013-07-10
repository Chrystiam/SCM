class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.string :codigo
      t.references :programa

      t.timestamps
    end
    add_index :fichas, :programa_id
  end
end
