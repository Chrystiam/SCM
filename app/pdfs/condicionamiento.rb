# encoding: UTF-8
class Condicionamiento < Prawn::Document

	def initialize(acta,queja,fecha,año,view)
	   super()
	   @acta = acta
	   @queja = queja
	   @fecha = fecha
	   @año = año
	   logo
	   draw_text "Señor@ Aprendiz", :at => [10, 620], size: 10
	   draw_text "#{@queja.nombres} #{@queja.apellidos} ", :at => [10, 605], size: 10
	   draw_text "Programa: #{@acta.comite.programa.descripcion} ", :at => [10, 590], size: 10
	   draw_text "Ficha: #{@queja.ficha} ", :at => [10, 575], size: 10
	   draw_text "SENA: centro de formacion en disaño confeccion y moda  ", :at => [10, 560], size: 10
	   draw_text "Asunto: Condicionamiento de matrícula.",:at => [270, 535], size: 10
	   condition_details
	   condition_firmas
	   condition_footer
	   
	end

	def logo
	    logopath =  "#{Rails.root}/app/assets/images/senac.jpg"
	    image logopath, :width => 60, :height => 64, :at => [250, 740]
	    draw_text "59202-1", :at => [270,660], size: 10
	    draw_text "Itagui #{@fecha}", :at => [270, 650], size: 10

	end

	def condition_details
    
	    draw_text "Respetado(a) Señor(a):  #{@queja.nombres} #{@queja.apellidos} ", :at => [10, 515], size: 10
	    draw_text "Le informamos que luego de haber realizado el procedimiento para el análisis de su situación en el proceso de", :at => [10, 495], size: 10
	    draw_text "formación en términos académicos, que usted adelanta; el Comité de Evaluación y Seguimiento reunido el #{@acta.comite.fcomite.fecha}", :at => [10, 484], size: 10
	    draw_text "recomienda como medida sancionatoria un condicionamiento de matrícula, con el respectivo plan de mejoramiento ", :at => [10, 475], size: 10
	    draw_text "como medida formativa.", :at => [10,466],size: 10

	    draw_text "Teniendo en cuenta que es un deber del Aprendiz el cumplimiento de todas las actividades del proceso de formación", :at => [10, 453], size: 10
	    draw_text "y alcanzar los objetivos de las competencias propias de la Tecnología, se le realiza este Condicionamiento de Matrícula,", :at => [10, 442], size: 10
	    draw_text "el instructor con quien se elaborará el Plan de Mejoramiento Académico es", :at => [10, 430], size: 10

	    draw_text "Según el Artículo 31 del Reglamento del Aprendiz SENA, le recordamos su derecho de reposición el cual", :at => [10, 415], size: 10
	    draw_text "puede llevar a cabo dentro de los 5 días hábiles luego de ser notificado. Lo invitamos a asumir una actitud más", :at => [10, 404], size: 10
	    draw_text "responsable y comprometida con su proceso de formación, acorde con el manual de evaluación y reglamento de aprendices. ", :at => [10, 393], size: 10
    end

    def condition_firmas

    	draw_text "#{@queja.programa.coordinador.nombre}", :at => [270, 340], size: 10
    	draw_text "Subdirector(a)", :at => [270, 329], size: 10
    	draw_text "Centro de formacion en diseño confecion y moda ", :at => [270, 318], size: 10
    	draw_text "La Decision, Se Notifica él ______________________ de  #{@año}, personalmente a _________________________________", :at => [10, 290], size: 10
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

	def condition_footer

		
		draw_text "Ministerio de trabajo", :at => [225, 100], size: 10
		draw_text "Servicio Nacional De Aprendizaje", :at => [190, 89], size: 11, :style => :bold
		draw_text "Regional Antioquia", :at => [220, 78], size: 11, :style => :bold
		draw_text "________________________________________________", :at => [70, 76], size: 15, :style => :bold
		draw_text "Calle  63  58B03  Itagui-Calatrava", :at => [200, 65], size: 10
		draw_text "www.sena.edu.co - Línea gratuita nacional: 01 8000 9 10 270", :at => [140, 54], size: 10
	end
end