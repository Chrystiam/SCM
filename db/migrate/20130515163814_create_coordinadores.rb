class CreateCoordinadores < ActiveRecord::Migration
  def change
    create_table :coordinadores do |t|
      t.string :nombre
      t.string :email
      t.references :centro

      t.timestamps
    end
    add_index :coordinadores, :centro_id
  end
end
