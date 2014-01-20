
class ComiteList < Prawn::Document

  # 1- Método constructor de la clase comitelist 

  def initialize(comites, fcomite, view )
   super()
   logo 
   @comites = comites
   @fcomite = fcomite
   @vista = view
   draw_text "Programación Comité #{@fcomite.tipo}", :at => [105, 620], size: 18
   draw_text "Lugar: #{@fcomite.lugar}", :at => [180, 590], size: 18
   draw_text "Fecha: #{@fcomite.fecha}", :at => [235, 563], size: 18
   comite_details

  end

  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = comiteList.new.to_pdf(@comites,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "comiteslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }



  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo_sena.png"
    image logopath, :width => 60, :height => 74

    logoscm = "#{Rails.root}/app/assets/images/scm.png"
    image logoscm, :at => [450, 750], :scale => 0.48
    move_down 10
    draw_text "CENTRO DE FORMACIÓN EN DISEÑO, CONFECCIÓN Y MODA", :at => [70, 700], size: 15
    draw_text "COMITÉ  DE EVALUCIÓN Y SEGUIMIENTO", :at => [145, 670], size: 15
  end

  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end

  #Método para almacenar y mostrar los registros del detalle de la orden
  def comite_item_rows
    [[ "Hora","Nombre Aprendices", "Programa","Ficha","Miembros Comite"]] +
     
    @comites.map do |comite|
      

      [
        "#{comite.hora} ",
        "#{comite.nombreapren} ",
        "#{comite.programa.abreviatura} ",
        "#{comite.ficha} ",

        @userscomites = userscomite(comite.id)
      ]
    end 
  end

  def userscomite(comiteid)
      @comite = Comite.find(comiteid)
      @usuarios = @comite.usercomites.all

      @cadena = ""
      @usuarios.map do |uc|
        @cadena += "#{uc.nombre}\n "
      end
      return @cadena
  end 
  #Método que imprime la tabla de las ordenes que hay
  def comite_details
    move_down 80
    table comite_item_rows, :width => 510 do
      row(0).font_style = :bold
      columns(0..4).align = :left
      self.header = true
      self.column_widths = {0 => 65, 1 => 130, 2 => 70, 3 => 65,4 => 180, 5=>180}
    end
    
  end
end