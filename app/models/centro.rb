class Centro < ActiveRecord::Base
  attr_accessible :abreviatura, :nombre

    def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end
end
