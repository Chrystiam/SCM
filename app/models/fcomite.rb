class Fcomite < ActiveRecord::Base
	has_many :comites, :dependent => :destroy
	accepts_nested_attributes_for :comites
    attr_accessible :fecha, :lugar, :tipo, :tiempo_caso
end
