
class QuejaList < Prawn::Document

  # 1- Método constructor de la clase quejalist 

  def initialize(quejas, view)
     super()
     logo 
     @quejas = quejas
     @vista = view
     queja_details
  end

  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = quejaList.new.to_pdf(@quejas,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "quejaslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(quejas, view)
    logo
    @quejas = quejas
    @vista = view
    queja_details
    render
  end

  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logosena.jpg"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "Listado de Quejas", :at => [150, 575], size: 22
    text "Logo"
  end

  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end

  #Método para almacenar y mostrar los registros del detalle de la orden
  def queja_item_rows
    [["Fecha", "nombre", "apellidos", "TipoDoc", "identificacion", "telefono", "Email"]] +
    @quejas.map do |queja|
      [ "#{queja.created_at} ",
        "#{queja.nombres} ",
        "#{queja.apellidos} ",
        "#{queja.tipo_documento.descripcion} ",
        "#{queja.identificacion} ",
        "#{queja.telefono} ",
        "#{queja.email} ",
      ]

    end
  end

  #Método que imprime la tabla de las ordenes que hay
  def queja_details
    move_down 80
    table queja_item_rows, :width => 560 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 80, 1 => 80, 2 => 80, 3 => 80, 4 => 80, 5 => 80, 6 => 80, 7 => 80}
    end
  end
end
