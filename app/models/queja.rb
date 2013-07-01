class Queja < ActiveRecord::Base

  belongs_to :tipo_documento
  belongs_to :falta
  belongs_to :cargo
  belongs_to :ficha
  belongs_to :programa
  has_many :comites
  

  attr_accessible :apellidos, :apellidosinformante, :cargo, :descripcion, :direccioninformante,:fechainforme, :nombres, :nombresinformante,  :testigos, :falta_id, :tipo_documento_id, :tipo_documento_descripcion, :identificacion, :cargo_id, :cargo_descripcion, :evidencia, :telefono, :email, :descargos, :programa_id, :programa_descripcion, :ficha_id, :fecha_codigo

  validates_presence_of :ficha_id

  has_attached_file :evidencia, :styles => { :small => "150x150>", :lsmall => "30x30>" }

  validates_attachment_presence :evidencia
  validates_attachment_size :evidencia, :less_than => 5.megabytes
  validates_attachment_content_type :evidencia, :content_type => ['image/jpeg', 'image/png', 'imagen/jpg', 'application/pdf', 'text/plain']


  #buscador
  def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
