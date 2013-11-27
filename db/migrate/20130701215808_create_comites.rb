class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.string :hora
      t.text :nombreapren
      t.references :programa
      t.string :ficha
      t.references :fcomite
      
      t.timestamps
    end
    add_index :comites, :fcomite_id
    add_index :comites, :programa_id
  end
end
