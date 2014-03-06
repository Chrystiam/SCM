# encoding: UTF-8
class CitacionList < Prawn::Document

	def initialize(queja,comite,fecha,año,view)
	   super()
	   @queja = queja
	   @comite = comite
	   @vista = view
	   @fecha = fecha
	   @año = año
	   logo
	   draw_text "Señor@ Aprendiz", :at => [10, 620], size: 10
	   draw_text "#{@queja.nombres} #{queja.apellidos} ", :at => [10, 605], size: 10
	   draw_text "Programa: #{@queja.programa.descripcion} ", :at => [10, 590], size: 10
	   draw_text "Ficha: #{@queja.ficha} ", :at => [10, 575], size: 10
	   draw_text "SENA: centro de formacion en disaño confeccion y moda  ", :at => [10, 560], size: 10
	   draw_text "Asunto: Citacion a Comite de Evaluacion y seguimiento",:at => [270, 535], size: 10
	   citacion_details
	   citacion_firmas
	   citacion_footer
	end

	def logo
	    logopath =  "#{Rails.root}/app/assets/images/senac.jpg"
	    image logopath, :width => 60, :height => 64, :at => [250, 740]
	    draw_text "Itagui #{@fecha}", :at => [270, 650], size: 10

	end

	def citacion_details
    
	    draw_text "Respetado(a) Aprendiz", :at => [10, 515], size: 10
	    draw_text "Teniendo en cuenta el informe de su proceso  presentado por los instructores, donde se  expresa que ha tenido", :at => [10, 495], size: 10
	    draw_text "dificultades en términos académicos y disciplinarios en su proceso de formación, se anexa copia de la comunicación", :at => [10, 484], size: 10
	    draw_text "y pruebas presentadas por los Instructores. ", :at => [10, 475], size: 10

	    draw_text "Por lo anterior, usted debe presentarse ante el Comité de Evaluación y Seguimiento para que presente los descargos,", :at => [10, 461], size: 10
	    draw_text "donde tendrá la posibilidad de ejercer su derecho de controvertir las pruebas y presentar las que considere pertinentes", :at => [10, 450], size: 10
	    draw_text "para el caso", :at => [10, 438], size: 10

	    draw_text "El Comité se realizará el día #{@fecha}, a las #{@comite.hora}. En #{@comite.fcomite.lugar},", :at => [10, 423], size: 10
	    draw_text "donde es necesaria su asistencia con la información que usted considere necesaria.", :at => [10, 412], size: 10
	    draw_text "Cordialmente: ", :at => [10, 390], size: 10
    end

    def citacion_firmas

    	draw_text "#{@queja.programa.coordinador.nombre}", :at => [270, 340], size: 10
    	draw_text "Coordiinador Academico", :at => [270, 329], size: 10
    	draw_text "Centro de formacion en diseño confecion y moda ", :at => [270, 318], size: 10
    	draw_text "Se notifica el ______________________ de año #{@año}, personalmente a _________________________________________", :at => [10, 290], size: 10
    	draw_text "con #{@queja.tipo_documento.sigla} N°:#{@queja.identificacion},  alumno(a) de: #{@queja.programa.descripcion}  ", :at => [10, 270], size: 10
    	draw_text "_________________________________", :at => [10, 230], size: 10
    	draw_text "El notificador", :at => [70, 220], size: 10
    	draw_text "_________________________________", :at => [10, 200], size: 10
    	draw_text "C.C", :at => [70, 190], size: 10
    	draw_text "_________________________________", :at => [350, 230], size: 10
    	draw_text "El notificado", :at => [410, 220], size: 10
    	draw_text "_________________________________", :at => [350, 200], size: 10
    	draw_text "C.C", :at => [410, 190], size: 10
	end

	def citacion_footer

		draw_text "SENA", :at => [250, 140], size: 12
		draw_text "Ministerio de trabajo", :at => [225, 100], size: 10
		draw_text "Servicio Nacional De Aprendizaje", :at => [190, 89], size: 11, :style => :bold
		draw_text "Regional Antioquia", :at => [220, 78], size: 11, :style => :bold
		draw_text "________________________________________________", :at => [70, 76], size: 15, :style => :bold
		draw_text "Calle  63  58B03  Itagui-Calatrava", :at => [200, 65], size: 10
		draw_text "www.sena.edu.co - Línea gratuita nacional: 01 8000 9 10 270", :at => [140, 54], size: 10
	end
end