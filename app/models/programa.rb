class Programa < ActiveRecord::Base
    
    #referencia de las tablas quejas,centros y fichas 
    has_many :quejas
    belongs_to :centro
    has_many :fichas
    
    #atributos
    attr_accessible :abreviatura, :descripcion, :centro_id, :estado

    #buscador
    def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end
end
