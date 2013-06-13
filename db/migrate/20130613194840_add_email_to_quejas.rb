class AddEmailToQuejas < ActiveRecord::Migration
  def change
    add_column :quejas, :email, :string
  end
end
