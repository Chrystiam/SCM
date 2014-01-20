class Comite < ActiveRecord::Base
  
  #referencia de las tablas quejas,faltas y prioridades
  belongs_to :queja
  belongs_to :falta
  belongs_to :prioridad
  belongs_to :fcomite
  has_many   :usercomites
  belongs_to :programa

  #atributos
  attr_accessible :hora, :nombreapren,:programa_id, :ficha, :fcomite_id 
    #buscador
  def self.search(search)
		where('hora like ?', "%#{search}%",)
	end

  #metodo para recobrar los correos de los userrscomite 
  def self.emails(emails)
    @fcreacio = emails.split(",")
    return  @fcreacio
  end
end
