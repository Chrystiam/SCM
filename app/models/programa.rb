class Programa < ActiveRecord::Base
  attr_accessible :abreviatura, :descripcion, :ficha

  #buscador
    def self.search(search)
		where('ficha like ?', "%#{search}%",)
	end

end
