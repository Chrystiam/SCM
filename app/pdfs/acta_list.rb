class ActaList < Prawn::Document

  # 1- Método constructor de la clase actalist 

  def initialize(actas, view)
     super()
     logo 
     @actas = actas
     @vista = view
     acta_details
  end

  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = actaList.new.to_pdf(@actas,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "actaslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(actas, view)
    logo
    @actas = actas
    @vista = view
    acta_details
    render
  end

  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logosena.jpg"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "Listado de actas", :at => [150, 575], size: 22
    text "Logo"
  end

  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end

  #Método para almacenar y mostrar los registros del detalle de la orden
  def acta_item_rows
    [["Ciudad", "Fecha", "Hora_Inicio", "Hora_Terminacion", "Lugar"]] +
    @actas.map do |acta|
      [ "#{acta.ciudad} ",
        "#{acta.fecha} ",
        "#{acta.hora_inicio} ",
        "#{acta.hora_terminacion} ",
        "#{acta.lugar} " ]
    end
  end

  #Método que imprime la tabla de las ordenes que hay
  def acta_details
    move_down 80
    table acta_item_rows, :width => 520 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 100, 1 => 100, 2 => 100, 3 => 120, 4 => 100}
    end
  end
end
