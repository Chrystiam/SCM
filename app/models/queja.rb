class Queja < ActiveRecord::Base

  belongs_to :tipo_documento
  belongs_to :falta
  belongs_to :cargo
  belongs_to :programa

  attr_accessible :apellidos, :apellidosinformante, :cargo, :descripcion, :direccioninformante, 
:fechainforme, :ficha, :nombres, :nombresinformante, :programa, :testigos, :falta_id, :tipo_documento_id,
:identificacion, :programa_id, :cargo_id, :descargos

#buscador
    def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
