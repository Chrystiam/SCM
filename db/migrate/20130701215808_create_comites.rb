class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.date :fecha
      t.time :hora
      t.string :lugar
      t.references :queja
      t.references :falta

      t.timestamps
    end
    add_index :comites, :queja_id
    add_index :comites, :falta_id
  end
end
