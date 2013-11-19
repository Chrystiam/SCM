class Comite < ActiveRecord::Base
  
  #referencia de las tablas quejas,faltas y prioridades
  belongs_to :queja
  belongs_to :falta
  belongs_to :prioridad

  #atributos
  attr_accessible :fecha, :hora, :lugar, :falta_id, :queja_id, :queja_nombres, :prioridad_id
    #buscador
    def self.search(search)
		where('lugar like ?', "%#{search}%",)
	end
end
