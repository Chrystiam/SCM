class Usercomite < ActiveRecord::Base

	#referencia de la tabla cargos
    belongs_to :cargo
    belongs_to :comite

    #atributos
    attr_accessible :nombre, :emails, :cargo_id, :comite_id
    
    #buscador
    def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end

end
