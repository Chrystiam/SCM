class Ficha < ActiveRecord::Base

  #referencias de las tablas programas y quejas
  belongs_to :programa
  
  #atributos
  attr_accessible :codigo, :programa_id, :estado
  
  #buscador
  def self.search(search)
		where('codigo like ?', "%#{search}%",)
	end
end
