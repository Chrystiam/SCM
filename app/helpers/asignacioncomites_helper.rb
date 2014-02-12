module AsignacioncomitesHelper

	def hora_citacion(hora,tiempo_caso)
		@ho = Time.now.strftime("%Y/%m/%d #{hora}").to_time
		tiempo_caso = tiempo_caso.to_i * 60	
		@ho = @ho + tiempo_caso
	    @hora = @ho.strftime("%I:%M %p")

	    return @hora
    	
    end
end
