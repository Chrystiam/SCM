class CreateUsercomites < ActiveRecord::Migration
  def change
    create_table :usercomites do |t|
      t.string :nombre
      t.text  :emails
      t.references :comite
      t.references :cargo

      t.timestamps
    end
    add_index :usercomites, :comite_id
    add_index :usercomites, :cargo_id
  end
end
