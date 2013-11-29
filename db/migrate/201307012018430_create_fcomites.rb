class CreateFcomites < ActiveRecord::Migration
  def change
    create_table :fcomites do |t|
      t.string :fecha
      t.string :lugar
      t.string :tipo
     

      t.timestamps
    end
  end
end
