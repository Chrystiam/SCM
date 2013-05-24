class Cargo < ActiveRecord::Base

  has_many :quejas
  
  attr_accessible :descripcion 

  def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end

end
