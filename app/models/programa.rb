class Programa < ActiveRecord::Base
  
  has_many :quejas
  belongs_to :centro
  has_many :fichas
  
  attr_accessible :abreviatura, :descripcion, :centro_id, :estado

    def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end
end
