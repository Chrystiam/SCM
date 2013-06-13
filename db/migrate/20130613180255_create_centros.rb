class CreateCentros < ActiveRecord::Migration
  def change
    create_table :centros do |t|
      t.string :nombre
      t.string :abreviatura

      t.timestamps
    end
  end
end
