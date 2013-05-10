class CreateDestroy < ActiveRecord::Migration
  def change
    create_table :destroy do |t|
      t.string :cargo
      t.string :descripcion

      t.timestamps
    end
  end
end
