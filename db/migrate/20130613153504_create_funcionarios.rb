class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.string :email
      t.string :direccion
      t.string :telefono
      t.string :fch_nacimiento
      t.string :cargo

      t.timestamps
    end
  end
end
