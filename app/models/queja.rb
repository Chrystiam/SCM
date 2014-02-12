class Queja < ActiveRecord::Base
  
  #referencia de la tablas tipo documentos,faltas,cargos,fichas,programas y centros
  belongs_to :tipo_documento
  belongs_to :falta
  belongs_to :programa
  belongs_to :centro
  belongs_to :coordinador
  belongs_to :estado

  
  #atributos
 
  attr_accessible :fechainforme, :nombres,:evidencia,:apellidos,:tipo_documento_id,:identificacion,:telefono, :estado_id
  attr_accessible :email,:programa_id,:ficha,:descripcion,:falta_id,:testigos,:nombresinformante,:direccioninformante,:cargo,:coordinador_id
  attr_accessible :nombreinfor
      
       
     
   
  
  
  #paperclip
  has_attached_file :evidencia, :styles => { :small => "150x150>", :lsmall => "30x30>" },
  :default_url => "senac.jpg"

  
  
  #validaciones
  validates_attachment_presence :evidencia
  validates_attachment_size :evidencia, :less_than => 5.megabytes
  validates_attachment_content_type :evidencia , :content_type => ['image/jpeg', 'image/png', 'imagen/jpg', 'application/pdf', 'text/plain']


  #buscador
  def self.search(search)
		where('nombres like ? or apellidos like ? ', "%#{search}%", "%#{search}%")
	end

  def self.indes(userid)
    @quejauser = Queja.where(:userid => userid)
  end
  
  #metodo para retornar el nombe de rol que tiene el usuario registrado
  def self.has_role(userid)
    @userid = UserRole.find(userid)
    @userolname = Role.find(@userid.role_id)
    @rolename = @userolname.name
    return @rolename.downcase  
  end
end
