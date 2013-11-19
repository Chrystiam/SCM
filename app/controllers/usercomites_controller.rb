class UsercomitesController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @usercomites  = Usercomite.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    
    #esta variable trae todos los registros para el pdf
    @a= Usercomite.all 
    output = UsercomiteList.new(@a,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "usercomiteList.pdf", :type => "application/pdf", 
        :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @usercomites  }
    end
  end
  

  def show
    @usercomite = Usercomite.find(params[:id])
  end

  
  def new
    @usercomite = Usercomite.new
  end

 
  def edit
    @usercomite = Usercomite.find(params[:id])
  end

 
  def create
    @usercomite = Usercomite.new(params[:usercomite])
    render :action => :new unless @usercomite.save
    @usercomites = Usercomite.all
  
  end

 
  def update
    @usercomite = Usercomite.find(params[:id])
    render :action => :edit unless @usercomite.update_attributes(params[:usercomite])
  end

 
  def destroy
    @usercomite = Usercomite.find(params[:id])
    @usercomite.destroy
    @usercomites = Usercomite.all
  end

  #ordenamiento
  private
  def sort_column
    Acta.column_names.include?(params[:sort]) ? params[:sort] : "nc"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
