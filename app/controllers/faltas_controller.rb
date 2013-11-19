class FaltasController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  def index
    #numero de registros
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @faltas  = Falta.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

  
  def show
    @falta = Falta.find(params[:id])
  end

  
  def new
    @falta = Falta.new
  end

  
  def edit
    @falta = Falta.find(params[:id])
  end

 
  def create
    @falta = Falta.new(params[:falta])
    render :action => :new unless @falta.save
    @faltas = Falta.all
  end

 
  def update
    @falta = Falta.find(params[:id])
    render :action => :edit unless @falta.update_attributes(params[:falta])
  end

  
  def destroy
    @falta = Falta.find(params[:id])
    @falta.destroy
    @faltas = Falta.all
  end
  
  #ordenamiento
  private
  def sort_column
    Falta.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
