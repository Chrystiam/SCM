class Queja < ActiveRecord::Base

  belongs_to :tipo_documento
  belongs_to :falta
  belongs_to :cargo
  belongs_to :programa

  attr_accessible :apellidos, :apellidosinformante, :cargo, :descripcion, :direccioninformante, 
  :fechainforme, :ficha, :nombres, :nombresinformante, :programa, :testigos, :falta_id, :tipo_documento_id,
  :identificacion, :programa_id, :cargo_id, :descargos, :evidencia


  has_attached_file :evidencia, :styles => { :small => "150x150>", :lsmall => "30x30>" }

  validates_attachment_presence :evidencia
  validates_attachment_size :evidencia, :less_than => 5.megabytes
  validates_attachment_content_type :evidencia, :content_type => ['image/jpeg', 'image/png', 'imagen/jpg', 'application/pdf', 'text/plain']


  #buscador
  def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
