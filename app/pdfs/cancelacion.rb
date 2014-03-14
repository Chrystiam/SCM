# encoding: UTF-8
class Cancelacion < Prawn::Document

	def initialize(acta,configuracion,queja,fecha,año,view)
	   super(:margin => [20])
	   stroke_bounds
	   @acta = acta
	   @configuracion = configuracion
	   @queja = queja
	   @fecha = fecha
	   @año = año
	   header
	   subdirector_details
	   consideraciones_datails
	   start_new_page(:margin => [30])
	   stroke_bounds
	   resuelve_details
	   firmas_datails
	end

	def header
	    logopath =  "#{Rails.root}/app/assets/images/senac.jpg"
	    image logopath, :width => 40, :height => 40
	    draw_text "Antioquia", :at => [10,695], size: 9, bold: true
	    draw_text "59202", :at => [14,685],size: 8
	    move_down 10
	    draw_text "Resolucion N°                        de #{@año}", :at => [230, 705], size: 9, :style => :bold
	    draw_text "Por la cual se cancela el registro de matrícula de la aprendiz  #{@queja.nombres} #{@queja.apellidos}", :at => [170, 680], size: 9
	    draw_text "identificado(a) con #{@queja.tipo_documento.descripcion} número #{@queja.identificacion}, N° de ficha #{@queja.ficha}", :at => [180, 670], size: 9
	end
 
	def subdirector_details
    	text_box "#{@configuracion.subdirector}", :at => [10,650], :size => 10 
	end

    def consideraciones_datails
    	draw_text "CONSIDERANDO", :at => [230,570], :size => 11, :style => :bold
    	text_box "#{@configuracion.considerando}", :at => [10,540], :size => 10  
	end

	def resuelve_details

		draw_text "RESUELVE", :at => [230,695], :size => 10, :style => :bold
		draw_text "ARTICULO PRIMERO.", :at => [10,650], :size => 11, :style => :bold
		draw_text "Acoger la recomendación del Comité de Evaluación y Seguimiento, en el sentido de cancelar", :at => [130,650], :size => 10
		text_box "el registro de matrícula para señor(a) #{@queja.nombres} #{@queja.apellidos} , identificado(a) con #{@queja.tipo_documento.descripcion} N° #{@queja.identificacion},  matriculada en el programa Manejo de Maquinas de  Confección Industrial,  porque injustificadamente no se presenta por mas de tres días consecutivos al desarrollo de su etapa productiva.", :at => [10,645], :size => 10

		draw_text "ARTICULO SEGUNDO.", :at => [10,590], :size => 10, :style => :bold
		draw_text "Como consecuencia de la cancelación de la matrícula para señor(a) #{@queja.nombres}#{@queja.apellidos}", :at => [120,590], :size => 10
		text_box " pierde el carácter de Aprendiz SENA, y dicha sanción, tendrá una vigencia de seis (6) meses, término en el cual no podrá participar en procesos de ingreso a la institución.", :at => [10,585], :size => 10

		draw_text "ARTICULO TERCERO.", :at => [10,535], :size => 10, :style => :bold
		draw_text "Contra este acto procede el recurso de reposición, el cual deberá ser presentado mediante", :at => [120,535], :size => 10
		text_box  "escrito dirigido a la Subdirectora del Centro, dentro de los cinco (5) días hábiles siguientes a la fecha de notificación personal o de la desfijación del edicto, anotando los fundamentos de la impugnación.", :at => [10,530], :size => 10

		draw_text "COMUNÍQUESE Y CÚMPLASE", :at => [200,400], :size => 11, :style => :bold
	end

	def firmas_datails

		draw_text "Maria Nela Galeano ", :at => [270, 350], size: 10
    	draw_text "Subdirectora", :at => [270, 335], size: 10
    	draw_text "Centro de formacion en diseño confecion y moda ", :at => [270, 320], size: 10
    	draw_text "La decision se notifica el _________ de  #{@año}, personalmente a _________________________________________", :at => [10, 200], size: 10
    	draw_text "con #{@queja.tipo_documento.sigla} N°:#{@queja.identificacion},  alumno(a) de: #{@queja.programa.descripcion}  ", :at => [10, 185], size: 10
    	draw_text "_________________________________", :at => [10, 80], size: 10
    	draw_text "El notificador", :at => [70,65], size: 10
    	draw_text "_________________________________", :at => [10,45], size: 10
    	draw_text "C.C", :at => [70, 35], size: 10
    	draw_text "_________________________________", :at => [350,80], size: 10
    	draw_text "El notificado", :at => [410,65], size: 10
    	draw_text "_________________________________", :at => [350, 45], size: 10
    	draw_text "C.C", :at => [410, 35], size: 10
		
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