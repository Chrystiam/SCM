class AddEmailinforToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :emailinfor, :string
  end
end
