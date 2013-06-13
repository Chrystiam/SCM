class Funcionario < ActiveRecord::Base
   attr_accessible :apellidos, :cedula, :direccion, :email, :fch_nacimiento, :cargo, :nombres, :string, :telefono
  
    def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
