class ComitesController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_filter :find_fcomite_and_comite 

  def index
   #numero de registro por pagina
   @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @comites  = @fcomite.comites.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    #esta variable trae todos los registros para el pdf
    #@a= Comite.all 
    #output = ComiteList.new(@a,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      #format.pdf{
       # send_data output.render, :filename => "qcomiteList.pdf", :type => "application/pdf", 
        #:disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      #}
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @comites  }
    end
  end
  

  def show
   
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
    @comites = @fcomite.comites.all
    @usercomites = Usercomite.all

    #@destinatarios = Usercomite.select("nombre,email")
    #@vec_destinatarios = UsercomiteMailer.emails_with_names(@destinatarios,"nombre","email")
    #@vec_destinatarios << UsercomiteMailer.add_destinatario(@usercomite)
    #email
    #UsercomiteMailer.usercomite_programacion(@usercomites,@comites, @vec_destinatarios, "notificacion de la queja" ).deliver
  end


  def update
    render :action => :edit unless @comite.update_attributes(params[:comite])
  end


  def destroy
    @comite = Comite.find(params[:id])
    @comite.destroy
    @comites = Comite.all
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
