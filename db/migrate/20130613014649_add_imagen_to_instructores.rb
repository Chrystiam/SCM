class AddImagenToInstructores < ActiveRecord::Migration
  
   def self.up
    add_attachment :instructores, :imagen
   end

   def self.down
    remove_attachment :instructores, :imagen
   end

end
