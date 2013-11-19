class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.string :fecha
      t.string :hora
      t.string :lugar
      t.references :queja
      t.references :falta
      t.references :prioridad

      t.timestamps
    end
    add_index :comites, :queja_id
    add_index :comites, :falta_id
    add_index :comites, :prioridad_id
  end
end
