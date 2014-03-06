class CreateConfiguraciones < ActiveRecord::Migration
  def change
    create_table :configuraciones do |t|
      t.text :subdirector
      t.text :considerando
      t.references :acta

      t.timestamps
    end
    add_index :configuraciones, :acta_id
  end
end
