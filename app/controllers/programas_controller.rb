class ProgramasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_filter :find_programa

  def index
    
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @programas  = Programa.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

 
  def show
    
  end


  def new
    @programa = Programa.new
  end


  def edit
    
  end


  def create
    @programa = Programa.new(params[:programa])
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

  private

  def find_programa
    @programa = Programa.find(params[:id]) if params[:id]
  end

  def sort_column
    Programa.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
