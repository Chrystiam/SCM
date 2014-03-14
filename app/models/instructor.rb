class Instructor < ActiveRecord::Base
	
	#atributos
    attr_accessible :apellidos, :cedula, :email, :nombres, :telefono
    
    #buscador
  	def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end
end
