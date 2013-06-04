class DescargosController < ApplicationController

  helper_method :sort_column, :sort_direction
  

  def index
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @descargos  = Descargo.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

  
  def show
    @descargo = Descargo.find(params[:id])
  end


  def new
    @descargo = Descargo.new
  end


  def edit
    @descargo = Descargo.find(params[:id])
  end


  def create
    @descargo = Descargo.new(params[:descargo])
    render :action => :new unless @descargo.save
    @descargos = Descargo.all
  end


  def update
    @descargo = Descargo.find(params[:id])
    render :action => :edit unless @descargo.update_attributes(params[:descargo])
  end


  def destroy
    @descargo = Descargo.find(params[:id])
    @descargo.destroy
    @descargos = Descargo.all
  end

  private
  def sort_column
    Descargo.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
