class Programa < ActiveRecord::Base
  belongs_to :centro
  
  attr_accessible :abreviatura, :descripcion, :ficha, :centro_id

    def self.search(search)
		where('ficha like ?', "%#{search}%",)
	end
end
