class Comite < ActiveRecord::Base
  belongs_to :queja
  belongs_to :falta
  attr_accessible :fecha, :hora, :lugar, :queja_id

    def self.search(search)
		where('lugar like ?', "%#{search}%",)
	end
end
