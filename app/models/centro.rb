class Centro < ActiveRecord::Base
    #referencia de la tabla programas
	has_many :programas
    #atributos
    attr_accessible :abreviatura, :nombre
    #buscador
    def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end
end
