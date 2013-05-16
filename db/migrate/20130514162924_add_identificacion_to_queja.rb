class AddIdentificacionToQueja < ActiveRecord::Migration
  def change
    add_column :quejas, :identificacion, :string
  end
end
