class ComitesController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
   @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @comites  = Comite.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end
  

  def show
    @comite = Comite.find(params[:id])
  end


  def new
    @comite = Comite.new
  end

 
  def edit
    @comite = Comite.find(params[:id])
  end


  def create
    @comite = Comite.new(params[:comite])
    render :action => :new unless @comite.save
    @comites = Comite.all
  end


  def update
    @comite = Comite.find(params[:id])
    render :action => :edit unless @comite.update_attributes(params[:comite])
  end


  def destroy
    @comite = Comite.find(params[:id])
    @comite.destroy
    @comites = Comite.all
  end

  private
  def sort_column
    Comite.column_names.include?(params[:sort]) ? params[:sort] : "lugar"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
