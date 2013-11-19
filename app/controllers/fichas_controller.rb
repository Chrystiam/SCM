class FichasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_filter :find_programa_and_ficha

  def index
    #numero de registros por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @fichas  = @programa.fichas.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end


  def show
  
  end

  
  def new
    @ficha = Ficha.new
  end


  def edit
  
  end
   

  def create
    
    @ficha = @programa.fichas.build(params[:ficha])
    render :action => :new unless @ficha.save
    @fichas = Ficha.all
  end


  def update
    render :action => :edit unless @ficha.update_attributes(params[:ficha])
  end


  def destroy
    @ficha.destroy
    @fichas = Ficha.all
  end
  
  #ordenamiento
  private
  def sort_column
    Ficha.column_names.include?(params[:sort]) ? params[:sort] : "codigo"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  #metodo para el select de fichas
  def find_programa_and_ficha
    @programa = Programa.find(params[:programa_id])
    @ficha = Ficha.find(params[:id]) if params[:id]
  end

end
