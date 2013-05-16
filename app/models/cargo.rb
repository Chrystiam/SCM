class Cargo < ActiveRecord::Base
  attr_accessible :descripcion 

  def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end

end
