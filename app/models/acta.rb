class Acta < ActiveRecord::Base
	belongs_to :comite
	has_many :configuraciones 
    #atributos 
    attr_accessible :comite_id, :conclusiones, :desarrollo_reunion, :fecha, :hora_inicio, :hora_terminacion, :objetivo_de_la_reunion
    
    #buscador
    def self.search(search)
		where('fecha like ?', "%#{search}%")
	end
end
