class CreateUsercomites < ActiveRecord::Migration
  def change
    create_table :usercomites do |t|
      t.string :nc
      t.string :cedula
      t.string :email
      t.string :fch_ncto
      t.references :cargo

      t.timestamps
    end
    add_index :usercomites, :cargo_id
  end
end
