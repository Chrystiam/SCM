class QuejaMailer < ActionMailer::Base

  default from: 'geraldinearenass@gmail.com'

	def self.emails_with_names(registros,coor,usermail)
    	
  	@datos = registros
  	@emails = []
  	
		@emails << "<"+ @datos + ">" 
          @emails << "<"+ coor +">"
          @emails << "<"+ usermail +">"
      return @emails
  end	
    
	def registration_confirmation(queja,asunto)
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/logo-sena.png")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
		@queja = queja
		#attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
		mail(:to => @queja.email, :subject => asunto)
  end

  def registro_queja_coordinador(queja,email,asunto)
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/logo-sena.png")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")

    @queja = queja
    #attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
    mail(:to => email, :subject => asunto)
  end

  def registro_queja_instructor(queja,email,asunto)
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/logo-sena.png")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
    
    @queja = queja
    #attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
    mail(:to => email, :subject => asunto)
  end

  def correcion_queja(bodyemail,queja,useremail,asunto)
    @queja = queja
    @body = bodyemail
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/logo-sena.png")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
    mail(:to => useremail , :subjet => asunto)
  end
end


#email

=begin
    
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
=end

