class Comite < ActiveRecord::Base
  
  #referencia de las tablas padre e hijas
  has_many :actas
  belongs_to :queja
  belongs_to :falta
  belongs_to :prioridad
  belongs_to :fcomite
  has_many   :usercomites
  belongs_to :programa
  belongs_to :asignacioncomite

  #atributos
  attr_accessible :idsqueja, :hora, :nombreapren,:programa_id, :ficha, :fcomite_id, :asignacioncomite_id, :quejaid 
    #buscador
  def self.search(search)
		where('hora like ?', "%#{search}%",)
	end

  #metodo para recobrar los correos de los userrscomite 
  def self.emails(emails)
    @fcreacio = emails.split(",")
    return  @fcreacio
  end

  def self.fechaes
    fecha = Time.now
    @mes = fecha.month
    case @mes
      when 1
        @m = "Enero"
      when 2
        @m = "Febrero"
      when 3
        @m = "Marzo"
      when 4
        @m = "Abril"
      when 5
        @m = "Mayo"
      when 6
        @m = "Junio"
      when 7
        @m = "Julio"
      when 8
        @m = "Agosto"
      when 9
        @m = "Septiembre"
      when 10
        @m = "Octubre"
      when 11
        @m = "Noviembre"
      when 12
        @m = "Diciembre"
    end
    @fecha = fecha.strftime("%d/#{@m}/%Y")
    @año = fecha.strftime("%Y")
    return @fecha, @año
  end
end
