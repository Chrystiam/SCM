class Queja < ActiveRecord::Base
  
  #referencia de la tablas tipo documentos,faltas,cargos,fichas,programas y centros
  belongs_to :tipo_documento
  belongs_to :falta
  belongs_to :cargo
  belongs_to :ficha
  belongs_to :programa
  belongs_to :centro

  
  #atributos
  attr_accessible :apellidos, :apellidosinformante, :cargo, :descripcion, :direccioninformante,:fechainforme, :nombres, :emailinfor
  attr_accessible :nombresinformante,  :testigos, :falta_id, :tipo_documento_id, :tipo_documento_descripcion, :identificacion, :estado
  attr_accessible :cargo_id, :cargo_descripcion, :evidencia, :telefono, :email, :descargos, :programa_id, :programa_descripcion, :ficha_id, :ficha_codigo, :centro_id
  
  
  
  #paperclip
  has_attached_file :evidencia, :styles => { :small => "150x150>", :lsmall => "30x30>" },
  :default_url => "logosena.jpg"

  
  
  #validaciones
  validates_presence_of :ficha_id
  validates_attachment_presence :evidencia
  validates_attachment_size :evidencia, :less_than => 5.megabytes
  validates_attachment_content_type :evidencia , :content_type => ['image/jpeg', 'image/png', 'imagen/jpg', 'application/pdf', 'text/plain']


  #buscador
  def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end

end
