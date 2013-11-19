class TipoDocumento < ActiveRecord::Base
  
    #referencia de la tabla quejas
    has_many :quejas 
  
    #atributos
    attr_accessible :descripcion, :sigla
  
    #validaciones
    validates_presence_of :descripcion

    validates_presence_of :sigla
 
    #buscador
    def self.search(search)
		where('sigla like ? or descripcion like ?', "%#{search}%", "%#{search}%" )
	end

	
end
