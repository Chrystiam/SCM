class Asignacioncomite < ActiveRecord::Base
	belongs_to :programa
    belongs_to :estado
    has_many :comites

    attr_accessible :apellidos, :ficha, :nombres, :programa_id, :fecha, :estado_id, :observaciones,:quejaid


	def self.splfecd(fecha)
	    fecrea = fecha.to_s 
	  	splife = fecrea.split("-")
	  	@fcreacio = splife[0]
	end

	def self.search(search)
		where('nombres like ? or apellidos like ? or fecha like ?', "%#{search}%", "%#{search}%","%#{search}%")
	end

end
