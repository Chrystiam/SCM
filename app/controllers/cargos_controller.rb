class CargosController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
   #numero de registro por pagina
   @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @cargos  = Cargo.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end


  def show
    @cargo = Cargo.find(params[:id])
  end


  def new
    @cargo = Cargo.new
  end


  def edit
    @cargo = Cargo.find(params[:id])
  end


  def create
    @cargo = Cargo.new(params[:cargo])
    render :action => :new unless @cargo.save
    @cargos = Cargo.all
  end

  
  def update
    @cargo = Cargo.find(params[:id])
    render :action => :edit unless @cargo.update_attributes(params[:cargo])
  end

 
  def destroy
    @cargo = Cargo.find(params[:id])
    @cargo.destroy
    @cargos = Cargo.all
  end
  
  #ordenamiento
  private
  def sort_column
    Cargo.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
