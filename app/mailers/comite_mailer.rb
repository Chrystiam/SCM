class ComiteMailer < ActionMailer::Base
  default from: 'geraldinearenass@gmail.com' 
    
  	def self.emails_with_names(registros)
    	
    	@datos = registros
    	@emails = []
    	@datos.each do |d|
			@emails << "<" + d + ">"
    	end	
    	return @emails
    end	


    #def self.add_destinatario(d)
    	#d.nombre  + "<"+ d.email + ">"
    #end	


	def usercomite_programacion(fcomite, comites, emails, asunto)
		@comites = comites.order("hora") 
		@fcomite = fcomite
		attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/logo-sena.png")
        attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
		#@comite_emails = Usercomite.plunck(:email)
		#@comite_emails << @queja.email
		#@cc = "pcarmona@misena.edu.co"
		#attachments "application/pdf"
		output = ComiteList.new(@comites,@fcomite,view_context)

		report_pdf_content = output.render()

	    attachments['paneaciocomite.pdf'] = {
	      mime_type: 'application/pdf',
	      content: report_pdf_content
	    } 
		#attachments['funny.pdf'] = File.read("#{Rails.root}/app/pdfs/comite_list.rb", :mode => 'rb')

		
		#vec_destinatarios = []
		#destinatarios.each do |d|
			#vec_destinatarios << d.nc + "<"+ d.email + ">"
			#@vec_destinatarios << d.email 
		#nd	
 		mail(:to => emails, :subject => asunto)
    end
end
