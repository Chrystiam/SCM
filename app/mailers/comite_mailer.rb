class ComiteMailer < ActionMailer::Base
  default from: 'geraldinearenass@gmail.com' 	


	def usercomite_programacion(fcomite, comites, emails, asunto)
		@comites = comites.order("hora") 
		@fcomite = fcomite
		attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
        attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")

		output = ComiteList.new(@comites,@fcomite,view_context)

		report_pdf_content = output.render()

	    attachments['programacion_comite.pdf'] = {
	      mime_type: 'application/pdf',
	      content: report_pdf_content
	    } 
		
 		mail(:to => emails, :subject => asunto)
    end

    def citacion_aprendiz(queja,comite,asunto)
    	@queja = queja
    	@comite = comite

    	attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
        attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")
        
    	output = QuejaList.new(@queja,view_context)

		report_pdf_content = output.render()

	    attachments['citacion.pdf'] = {
	      mime_type: 'application/pdf',
	      content: report_pdf_content
	    } 

    	mail(:to => @queja.email, :subject => asunto)
    end
end
