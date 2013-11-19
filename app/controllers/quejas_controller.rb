class QuejasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @quejas  = Queja.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    
    #esta variable trae todos los registros para el pdf
    @a= Queja.all 
    output = QuejaList.new(@a,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "quejaList.pdf", :type => "application/pdf", 
        :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }

      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.docx
      format.json { render json: @quejas  }
    end
  end

  #metodo para descargar evidencia
  def download
    @queja = Queja.find(params[:id])
    send_file(@queja.evidencia.path)
  end 


  def show
    @queja = Queja.find(params[:id])
  end

  
  def new
    @queja = Queja.new
    @fichas = Ficha.all
    @programas = Programa.all
  end

 
  def edit
    @fichas = Ficha.all
    @queja = Queja.find(params[:id])
  end

  
  #metodo para el select de centros
  #def update_programas
   # @programas = Programa.where('centro_id = ?', params[:centro_id])
    #render :partial => "programas", :object => @programas
  #end


  def create
    @queja = Queja.new(params[:queja])
    if @queja.save 
      envio_email
    else
      render :action => :new unless @queja.save
    end  
    
    @quejas = Queja.all
  end
  
  #metodo para el select de programas
  def update_ficha
    @fichas = Ficha.where('programa_id=?', params[:programa_id])
    render :partial => "ficha", :object => @fichas
  end
  
  def update
    @queja = Queja.find(params[:id])
    if @queja.update_attributes(params[:queja])
      #metodo de enviar correo
      envio_email  
    else
      render :action => :edit #unless @queja.update_attributes(params[:queja])
    end  
  end
   
  
  def destroy
    @queja = Queja.find(params[:id])
    @queja.destroy
    @quejas = Queja.all
  end
  
 
  private
  #ordenamiento
  def sort_column
    Queja.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def envio_email

    @destinatarios = Usercomite.select("nc,email")
    @vec_destinatarios = QuejaMailer.emails_with_names(@destinatarios,"nc","email")
    @vec_destinatarios << QuejaMailer.add_destinatario(@queja)
    #email
    QuejaMailer.registration_confirmation(@queja, @vec_destinatarios, "notificacion de la queja" ).deliver

  end

end
    
