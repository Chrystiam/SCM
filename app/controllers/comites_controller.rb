class ComitesController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_filter :find_fcomite_and_comite, :except => [:envio_email]

  def index
   #numero de registro por pagina
   @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @comites  = @fcomite.comites.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    #esta variable trae todos los registros para el pdf
    @a = @fcomite.comites.order("hora")
    @fcomite = Fcomite.find(params[:fcomite_id])
    output = ComiteList.new(@a,@fcomite,view_context) # Aquí instancio el documento pdf
  
    respond_to do |format|
      format.pdf{
       send_data output.render, :filename => "programacion_comite.pdf", :type => "application/pdf", 
        :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @comites  }
    end

  end
  

  def show

    @queja = Queja.find(@comite.quejaid)
    if params[:format] == "pdf"
      @fechaes, @año = Comite.fechaes
      output = CitacionList.new(@queja,@comite,@fechaes,@año,view_context) # Aquí instancio el documento pdf
      respond_to do |format|
        format.pdf{
          send_data output.render, :filename => "citacion.pdf", :type => "application/pdf", 
          :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
        }
      end
    end
   
  end


  def new
    @comite = Comite.new
  end

 
  def edit
   
  end
  

  def create
    @comite = @fcomite.comites.build(params[:comite])
    render :action => :new unless @comite.save
    @comites = Comite.all
  end

  def envio_email
    #datos para envio de email a los iembross del  comite y variables para enexar el pdf a el email
    @fcomite = Fcomite.find((params[:fcomite_id]))
    @comitespdf = Comite.where(:fcomite_id => (params[:fcomite_id]))
    @comite = Comite.find_by_fcomite_id(@fcomite.id)
    #email miembros comite
    #ComiteMailer.usercomite_programacion(@fcomite, @comitespdf, @emailusercom, "notificacion de la queja" ).deliver

    #variable para el envio de email con citacion a los aprendices que ya tienen programacion
    @comitespdf.each do |detalle_comite|
      quejaid =  detalle_comite.quejaid
      @comitea = Comite.find_by_quejaid(quejaid)
      @queja = Queja.find(quejaid)
      ComiteMailer.citacion_aprendiz(@queja,@comitea,"Citacion Comite Evaluacion y Seguimiento").deliver

      @usercomite = Usercomite.find_by_comite_id(@comite.id)
      @emailusercom = Comite.emails(@usercomite.emails)
      ComiteMailer.usercomite_programacion(@fcomite, @comitespdf, @emailusercom, "notificacion de la queja" ).deliver
    end
  end


  def update
    render :action => :edit unless @comite.update_attributes(params[:comite])
  end


  def destroy
    @comite = Comite.find(params[:id])
    @comite.destroy
    @comites = Comite.all
  end

  def asignar_userc
    @fcomite = Fcomite.find(params[:fcomite_id])
    @comite_id = params[:comite_id]
    @nombres = params[:nombres]
    @emails = params[:emails]
    Usercomite.create(:nombre => @nombres, :emails => @emails,:comite_id => @comite_id)
    @comites = Comite.all
    redirect_to fcomite_comites_path(@fcomite.id)
  end
  
  #ordenamiento
  private
  def sort_column
    Comite.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def find_fcomite_and_comite
    @fcomite = Fcomite.find(params[:fcomite_id])
    @comite = Comite.find(params[:id]) if params[:id]
  end
end
