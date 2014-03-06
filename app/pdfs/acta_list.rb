# encoding: UTF-8
class ActaList < Prawn::Document

  # 1- Método constructor de la clase actalist 

  def initialize(actas, view)
     super()
     @actas = actas
     @vista = view 
     header
     body
  end

  #Método para definir el logo con su ubicación así como el título del reporte  
  def header
    logopath =  "#{Rails.root}/app/assets/images/senac.jpg"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "SISTEMA INTEGRADO DE GESTIÓN", :at => [130, 705], size: 14
    draw_text "ACTA", :at => [230, 686], size: 14
    draw_text "Proceso Direccionamiento Estratégico", :at => [140, 670],size: 13
    draw_text "Procedimiento Control de Documentos y Registros", :at => [100, 656], size: 13
    draw_text "Código:  F002-P001-DE", :at => [410, 705], size: 13
    draw_text "Versión: 02", :at => [410, 680], size: 13
    draw_text "#{@actas.fecha}", :at => [410,656], size: 13
  end


  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end

  #Método para almacenar y mostrar los registros del detalle de la orden
  def acta_item_rows
    [[ "Fecha", "Hora_Inicio", "Hora_Terminacion"]] +
    @actas.map do |acta|
      [
        "#{acta.fecha} ",
        "#{acta.hora_inicio} ",
        "#{acta.hora_terminacion} " ]
    end
  end

  #Método que imprime la tabla de las ordenes que hay
  def acta_details
    move_down 80
    table acta_item_rows, :width => 300 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 100, 1 => 100, 2 => 100, 3 => 120, 4 => 100}
    end
  end

  def body

    bounding_box [0, cursor], :width => bounds.right, :height => 40 do
      
      text "Reunion Acta 95", :align => :center, :valign => :center
      transparent(2) { stroke_bounds }
    end

     table([
        ["Fecha \n\n  #{@actas.fecha}               ", "Hora inicio \n\n  #{@actas.hora_inicio}               ","Hora Terminacion \n\n   #{@actas.hora_terminacion}               "]
      ])

    bounding_box [0, cursor], :width => bounds.right, :height => 40 do
    
    text "Tema:  "+"Comite #{@actas.comite.fcomite.tipo} de Evaluación y  Seguimiento ", :valign => :center
    transparent(2) { stroke_bounds }
    end
    table([
        ["Objetivo:  #{@actas.objetivo_de_la_reunion} " ],
        ["Desarrollo de la Reunion:  #{@actas.desarrollo_reunion}"],
        ["Conclusiones:  #{@actas.conclusiones}"]
      ])

  end
  def tables

    my_table = make_table([ ["..."], ["subtable from another table"], ["..."] ])
    table([ ["just a regular row", "", "", "blah blah blah"],

      ["", "", "", ""],
      ["", "", my_table, ""],

      ["just another regular row", "", "", ""],
      ["", "", "", ""]])
      
  end
end
