class PrioridadesController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @prioridades  = Prioridad.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

  
  def show
    @prioridad = Prioridad.find(params[:id])
  end


  def new
    @prioridad = Prioridad.new
  end

 
  def edit
    @prioridad = Prioridad.find(params[:id])
  end

  
  def create
    @prioridad = Prioridad.new(params[:prioridad])
    render :action => :new unless @prioridad.save
    @prioridades = Prioridad.all
  end


  def update
    @prioridad = Prioridad.find(params[:id])
    render :action => :edit unless @prioridad.update_attributes(params[:prioridad])
  end


  def destroy
    @prioridad = Prioridad.find(params[:id])
    @prioridad.destroy
    @prioridades = Prioridad.all
  end
  
  #ordenamiento
  private
  def sort_column
    Prioridad.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
