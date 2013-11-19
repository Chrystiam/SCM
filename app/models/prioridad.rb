class Prioridad < ActiveRecord::Base
  
  #referencia de la tabla comite
  has_many :comites 
  
  #atributos
  attr_accessible :nombre
  
  #buscador
  def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end
end
