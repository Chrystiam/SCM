class Coordinador < ActiveRecord::Base

	belongs_to :centro
	has_many :programas
    attr_accessible :email, :nombre, :centro_id
end
