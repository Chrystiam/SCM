# encoding: UTF-8
class InstructorMailer < ActionMailer::Base
	
    default from: 'geraldinearenass@gmail.com'

    def user_instructor(instructor)

    	@instructor = instructor

    	attachments.inline['logo-sena.png'] = File.read("#{Rails.root}/app/assets/images/senac.jpg")
        attachments.inline['scm.png'] = File.read("#{Rails.root}/app/assets/images/scm.png")

        mail(:to => @instructor.email, :subject => "Registro como usuario de la aplicación ????")
    	
    end
end
