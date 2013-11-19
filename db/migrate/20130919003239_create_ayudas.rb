class CreateAyudas < ActiveRecord::Migration
  def change
    create_table :ayudas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
