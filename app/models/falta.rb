class Falta < ActiveRecord::Base
  
  #referencia de la tabla quejas
  has_many :quejas 
  
  #atributos
  attr_accessible :descripcion, :falta
  
  #validaciones
  validates_presence_of :descripcion

  validates_presence_of :falta

  #buscador
    def self.search(search)
		where('falta like ?', "%#{search}%",)
	end

end
