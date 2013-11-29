class ComiteMailer < ActionMailer::Base
  default from: 'geraldinearenass@gmail.com' 
    
  	def self.emails_with_names(registros,nombre,correo)
    	
    	@datos = registros
    	@emails = []
    	@datos.each do |d|
			@emails << d.nombre + "<"+ d.email + ">"
    	end	
    	return @emails
    end	


    #def self.add_destinatario(d)
    	#d.nombre  + "<"+ d.email + ">"
    #end	


	def usercomite_programacion(fcomite, comites, emails, asunto)
		@comites = comites
		@fcomite = fcomite
		#@comite_emails = Usercomite.plunck(:email)
		#@comite_emails << @queja.email
		#@cc = "pcarmona@misena.edu.co"
		#attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
		
		#vec_destinatarios = []
		#destinatarios.each do |d|
			#vec_destinatarios << d.nc + "<"+ d.email + ">"
			#@vec_destinatarios << d.email 
		#nd	
 		mail(:to => emails, :subject => asunto)
    end
end
