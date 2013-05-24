class QuejasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @quejas  = Queja.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

 
  def show
    @queja = Queja.find(params[:id])
  end


  def new
    @queja = Queja.new
  end

 
  def edit
    @queja = Queja.find(params[:id])
  end

  
  def create
    @queja = Queja.new(params[:queja])
    render :action => :new unless @queja.save
    @quejas = Queja.all
  end


  def update
    @queja = Queja.find(params[:id])
    render :action => :edit unless @queja.update_attributes(params[:queja])
  end

  
  def destroy
    @queja = Queja.find(params[:id])
    @queja.destroy
    @quejas = Queja.all
  end

  private
  def sort_column
    Queja.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
    
