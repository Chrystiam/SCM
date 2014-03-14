class CreateInstructores < ActiveRecord::Migration
  def change
    create_table :instructores do |t|
      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.string :email
      t.string :telefono

      t.timestamps
    end
  end
end
