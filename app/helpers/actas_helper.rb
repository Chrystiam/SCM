module ActasHelper

	def vpdf(acta)
		@acta = Acta.find(acta)
	    @comite = Comite.find(@acta.comite_id)
	    @idquejas = @comite.idsqueja.split(", ")
		
		return  @idquejas
	end

	def name(queja)
		@queja = Queja.find(queja)
	    @nombre = "#{@queja.nombres}" + "#{@queja.apellidos}"

		
		return  @nombre
	end
end
