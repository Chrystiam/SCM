class AddArchivoToAyuda < ActiveRecord::Migration
 	def self.up
 		add_attachment :ayudas, :archivo
	end
	def self.down
		 add_attachment :ayudas, :archivo
	end
end
