class QuejaList < Prawn::Document

  # 1- Método constructor de la clase quejalist 

  def initialize(queja, view)
    super()
    @queja = queja
    @vista = view
    queja_details
    fecha
    info
    descripcion
    testigo
    direccion
    firma
  end


  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/senac.jpg"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "Listado de Quejas", :at => [150, 575], size: 22
  end


  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end

  def queja_details
    
    bounding_box [0, cursor], :width => bounds.right, :height => 60 do
      
      text "CENTRO DE FORMACIÓN EN DISEÑO, CONFECCIÓN Y MODA\nFORMATO DE INFORME O QUEJA", :align => :center
      image "#{Rails.root}/app/assets/images/senac.jpg", :top => 43, :height => 50, :at => [0, bounds.top]
    end
    
  end

  def fecha
      table ([["\n\nFecha del Informe:  ""#{@queja.fechainforme}\n\n"],
      ]),
        :width => 500 do
        columns(1).align = :center
        self.header = true
        self.column_widths = {0 => 500, 2 => 70}
        columns(1).font_style = :bold
    end
  end

  def info
      table ([["\n\nNombre del Aprendiz:   ""#{@queja.nombres} "+"#{@queja.apellidos}               " "  -CC:  ""#{@queja.identificacion}            " "     \n\n Telefono:  ""#{@queja.telefono}" "\n\nPrograma:   ""#{@queja.programa.abreviatura}" "\n\nNo de Ficha:  ""#{@queja.ficha}\n\n"],
        ]),
          :width => 500 do
          columns(1).align = :center
          self.header = true
          self.column_widths = {0 => 500, 2 => 70}
          columns(1).font_style = :bold
      end
  end

  def descripcion
    table ([["Tipo de Falta:  #{@queja.falta.falta} \n" "\n Descripcion Detallada: \n " " \n #{@queja.descripcion}\n\n"],
      ]),
      :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 500, 2 => 70}
      columns(1).font_style = :bold
    end
  end

  def testigo
      
      table ([["\nTestigos o Pruebas que Aporta:  \n\n  #{@queja.testigos}"],
        ]),
        :width => 500 do
        columns(1).align = :center
        self.header = true
        self.column_widths = {0 => 500, 2 => 70}
        columns(1).font_style = :bold
      end
  end

 def direccion
     
      table ([["\nNombre y dirección de quien informa:     ""(Servidor Publico,Aprendiz,contratista,o cualquier persona que tenga conocimiento de los Hechos)\n\n  #{@queja.nombreinfor}"],
        ]),
        :width => 500 do
        columns(1).align = :center
        self.header = true
        self.column_widths = {0 => 500, 2 => 70}
        columns(1).font_style = :bold
      end
  end

  def firma
      
    table ([["\nFirma de quien Informa:  \n\n\n\n"],
          ]),
          :width => 500 do
          columns(1).align = :center
          self.header = true
          self.column_widths = {0 => 500, 2 => 70}
          columns(1).font_style = :bold
    end
  end

  #Método para almacenar y mostrar los registros del detalle de la orden
 

  #Método que imprime la tabla de las ordenes que hay
  def queja
    move_down 80
    table (

      [["Fecha creacion","#{@queja.created_at}"],
      ["Arendiz","#{@queja.nombres} "+"#{@queja.apellidos} "],
      ["Telefono","#{@queja.telefono}"],
      ["Email","#{@queja.email}"],
      ["Descripcion","#{@queja.descripcion}"],
      ["Telefono","#{@queja.estado.nombre}"],
      
    ]),
    :width => 380 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      #align = { 0 => 80, 1 => :left, 2 => :right, 3 => :right, 4 => :right, 5 => :right, 6 => :right,7 => :right, 8 => :left} 
      self.column_widths = {0 => 180, 1 => 200}
    end
  end
end
