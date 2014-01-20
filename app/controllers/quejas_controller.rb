class QuejasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    #buscador
    if Queja.has_role(current_user.id) == "instructor"
      @quejas  = Queja.indes(current_user.id).order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
      @estadoquejas = @quejas.where(:estado_id => 1)
      @estadoencomite =  @quejas.where(:estado_id => 2)
      @quejacorreccion =  @quejas.where(:estado_id => 3)
    else

      @quejas  = Queja.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
      @estadoquejas = Queja.where(:estado_id => 1) 
      @estadoencomite =  Queja.where(:estado_id => 2)
      @quejacorreccion =  Queja.where(:estado_id => 3)
    end
    #esta variable trae todos los registros para el pdf
    @a= Queja.all 
  end

  #metodo para descargar evidencia
  def download
    @queja = Queja.find(params[:id])
    send_file(@queja.evidencia.path)
  end 


  def show
    @queja = Queja.find(params[:id])
    
    if params[:format] == "pdf"
      output = QuejaList.new(@queja,view_context) # Aquí instancio el documento pdf
      respond_to do |format|
        format.pdf{
          send_data output.render, :filename => "quejaList.pdf", :type => "application/pdf", 
          :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
        }
      end
    end
  end

  
  def new
    @queja = Queja.new
   
    @programas = Programa.all
  end

 
  def edit
    @queja = Queja.find(params[:id])
  end

  
  #metodo para el select de centros
  #def update_programas
   # @programas = Programa.where('centro_id = ?', params[:centro_id])
    #render :partial => "programas", :object => @programas
  #end


  def create
    @queja = Queja.new(params[:queja])
    @queja.estado_id =  1
    @queja.userid = current_user.id

   
    #render :action => :new unless @queja.save
    #QuejaMailer.registration_confirmation(@queja).deliver

    if @queja.save 
      envio_email
      render fecha.js
    else
      render :action => :new unless @queja.save
    end  
    
  end

  def asigna
   
    @queja = Queja.find(params[:id])
    Asignacioncomite.create(:estado_id => 4, :nombres => @queja.nombres, :apellidos => @queja.apellidos, :programa_id => @queja.programa.id, :ficha => @queja.ficha)
    @queja.estado_id = 2
    @queja.save

  end

  def cuerpo_correo_correccion

    @queja = Queja.find(params[:id])
    @user = User.find(@queja.userid)
    
  end

  def corregir
    @queja = Queja.find(params[:queja])
    @useremail = params[:email]
    @bodyemail = params[:body]
    QuejaMailer.correcion_queja(@bodyemail,@queja,@useremail,"Corrección de la queja presentada" ).deliver
    @queja.estado_id = 3 
    @queja.save
    redirect_to quejas_path
  end
  
  #metodo para el select de programas

  #def update_ficha
  #  @fichas = Ficha.where('programa_id=?', params[:programa_id])
  #  render :partial => "ficha", :object => @fichas
  #end
  def update
    @queja = Queja.find(params[:id])
    #render :action => :edit unless @queja.update_attributes(params[:queja])
    render :action => :edit unless @queja.update_attributes(params[:queja])
    @queja.estado_id =  1
    @queja.save
  end
   
  
  def destroy
    @queja = Queja.find(params[:id])
    @queja.destroy
  end
  
 
  private
  #ordenamiento
  def sort_column
    Queja.column_names.include?(params[:sort]) ? params[:sort] : "estado_id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def envio_email

    @destiapren = @queja.email
    @desticoor = @queja.coordinador.email
    #@vec_destinatarios = QuejaMailer.emails_with_names(@destiapren,@desticoor,current_user.email)
    #@vec_destinatarios << QuejaMailer.add_destinatario(@queja)
    #email
    #QuejaMailer.registration_confirmation(@queja, "Citación a Comité de Evaluación y Seguimiento" ).deliver
    QuejaMailer.registro_queja_coordinador(@queja, @desticoor,"Notificación de Queja").deliver
    QuejaMailer.registro_queja_instructor(@queja,current_user.email, "Notificación de Queja" ).deliver
  end

end
    
