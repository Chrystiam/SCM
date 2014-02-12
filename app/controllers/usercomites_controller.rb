class UsercomitesController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  before_filter :find_comite_and_usercomite

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @usercomites  = @comite.usercomites.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)

    respond_to do |format|
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @usercomites  }
    end
  end
  

  def show
  end

  
  def new
    @usercomite = Usercomite.new
  end

 
  def edit
   
  end

 
  def create
    @usercomite = @comite.usercomites.build(params[:usercomite])
    render :action => :new unless @usercomite.save
    @usercomites = Usercomite.all
  
  end

  

 
  def update
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
    Acta.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def find_comite_and_usercomite
    @comite = Comite.find(params[:comite_id])
    @fcomite = Fcomite.find(params[:fcomite_id])
    @usercomite = Usercomite.find(params[:id]) if params[:id]
  end

end
