class Cargo < ActiveRecord::Base
    #referencia de la tabla queja
    has_many :quejas
    #atributos
    attr_accessible :descripcion 
    #buscador
    def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end

end
