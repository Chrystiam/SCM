class Instructor < ActiveRecord::Base
	
	#atributos
    attr_accessible :apellidos, :cedula, :direccion, :email, :fch_nacimiento, :modalidad, :nombres, :string, :telefono, :imagen
    
    #paperclip
    has_attached_file :imagen, :styles => { :small => "150x150>", :lsmall => "30x30>" }

    #validaciones
  	validates_attachment_presence :imagen
  	validates_attachment_size :imagen, :less_than => 5.megabytes
  	validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

    #buscador
  	def self.search(search)
		where('nombres like ?', "%#{search}%",)
	end
end
