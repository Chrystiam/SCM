#class QuejaMailer < ActionMailer::Base
    
#	def registration_confirmation(queja)

#		@queja = queja
#		attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
# 		mail(:to => queja.email, :subject => "Registro de Queja exitoso", :from => "geraldinearenass@gmail.com")
#    end

#end

#email
class QuejaMailer < ActionMailer::Base
  default from: 'geraldinearenass@gmail.com' 
    
  	def self.emails_with_names(registros,nombre,correo)
    	
    	@datos = registros
    	@emails = []
    	@datos.each do |d|
			@emails << d.nc + "<"+ d.email + ">"
    	end	
    	return @emails
    end	


    def self.add_destinatario(d)
    	d.nombres  + d.apellidos + "<"+ d.email + ">"
    	
    end	


	def registration_confirmation(queja, emails, asunto)
		@queja = queja
		#@comite_emails = Usercomite.plunck(:email)
		#@comite_emails << @queja.email
		#@cc = "pcarmona@misena.edu.co"
		attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
		
		#vec_destinatarios = []
		#destinatarios.each do |d|
			#vec_destinatarios << d.nc + "<"+ d.email + ">"
			#@vec_destinatarios << d.email 
		#nd	
 		mail(:to => emails, :subject => asunto)
    end
end