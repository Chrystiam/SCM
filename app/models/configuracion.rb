class Configuracion < ActiveRecord::Base
  belongs_to :acta
  attr_accessible :considerando, :subdirector, :acta_id
end
