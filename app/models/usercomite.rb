class Usercomite < ActiveRecord::Base

	#referencia de la tabla cargos
    belongs_to :cargo

    #atributos
    attr_accessible :cedula, :email, :fch_ncto, :nc, :cargo_id
    
    #buscador
    def self.search(search)
		where('nc like ?', "%#{search}%",)
	end

end
