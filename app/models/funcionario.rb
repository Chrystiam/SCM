class Funcionario < ActiveRecord::Base

	#atributos
    attr_accessible :apellidos, :cedula, :direccion, :email, :fch_nacimiento, :cargo, :nombres, :string, :telefono
  
    #buscador
    def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
