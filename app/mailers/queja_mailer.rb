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
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
		@queja = queja
		
		mail(:to => @queja.email, :subject => asunto)
  end

  def registro_queja_coordinador(queja,email,asunto)
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")

    @queja = queja
    @userqueja = User.find(@queja.userid)
    @coordinador = email
    mail(:to => @coordinador.email, :subject => asunto)
  end

  def registro_queja_instructor(queja,email,asunto)
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
    
    @queja = queja
    @userqueja = User.find(@queja.userid)
    mail(:to => email, :subject => asunto)
  end

  def correcion_queja(bodyemail,queja,useremail,asunto)
    @queja = queja
    @body = bodyemail
    attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
    attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
    mail(:to => useremail , :subjet => asunto)
  end
end



