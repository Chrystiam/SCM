class Acta < ActiveRecord::Base
    #atributos 
    attr_accessible :ciudad, :conclusiones, :desarrollo_reunion, :fecha, :firmas, :hora_inicio, :hora_terminacion, :lugar, :objetivo_de_la_reunion, :tema
    
    #buscador
    def self.search(search)
		where('ciudad like ?', "%#{search}%",)
	end

end
