class ActasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @actas  = Acta.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end


  def show
    @acta = Acta.find(params[:id])
  end

  
  def new
    @acta = Acta.new
  end


  def edit
    @acta = Acta.find(params[:id])
  end


  def create
    @acta = Acta.new(params[:acta])
    render :action => :new unless @acta.save
    @actas = Acta.all
  end


  def update
    @acta = Acta.find(params[:id])
    render :action => :edit unless @acta.update_attributes(params[:acta])
  end


  def destroy
    @acta = Acta.find(params[:id])
    @acta.destroy
    @actas = Acta.all
  end

  private
  def sort_column
    Acta.column_names.include?(params[:sort]) ? params[:sort] : "ciudad"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
