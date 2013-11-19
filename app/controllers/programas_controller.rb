class ProgramasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_filter :find_centro_and_programa

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @programas  = @centro.programas.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    #@programas  = Programa.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

 
  def show
    
  end


  def new
    @programa = Programa.new
  end


  def edit
    
  end


  def create
    @programa = @centro.programas.build(params[:programa])
    render :action => :new unless @programa.save
    @programas = Programa.all
  end


  def update
    render :action => :edit unless @programa.update_attributes(params[:programa])
  end


  def destroy
    @programa = Programa.find(params[:id])
    @programa.destroy
    @programas = Programa.all
  end

  #ordenamiento
  private
  def sort_column
    Programa.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  #metodo para el select de programa
  def find_centro_and_programa
    @centro = Centro.find(params[:centro_id])
    @programa = Programa.find(params[:id]) if params[:id]
  end
end
