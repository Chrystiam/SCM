class Asignacioncomite < ActiveRecord::Base
    attr_accessible :apellidos, :ficha, :nombres, :programa, :fecha


	def self.splfecd(fecha)
	    fecrea = fecha.to_s 
	  	splife = fecrea.split("-")
	  	@fcreacio = splife[0]
	end

	def self.search(search)
		where('nombres like ? or apellidos like ? or fecha like ?', "%#{search}%", "%#{search}%","%#{search}%")
	end
end
