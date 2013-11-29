class Fcomite < ActiveRecord::Base
	has_many :comites
  attr_accessible :fecha, :lugar, :tipo
end
