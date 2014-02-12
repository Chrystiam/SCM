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

	def self.hash_programa

		@as = Asignacioncomite.where(:estado_id => 4)
		@programas = []
		i = 0
		@as.each do |programa|

			@programa = Programa.find(programa.programa_id)
			id = @programa.id

			if i != id
			  @programas << @programa
			  i = programa.programa_id
			end
		end
		return @programas
	end

	def self.array_id(id)
		@ids = []
		@ids << id

		return @ids 		
	end
end
