class InstructoresController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @instructores  = Instructor.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

 
  def show
    @instructor = Instructor.find(params[:id])
  end


  def new
    @instructor = Instructor.new
  end


  def edit
    @instructor = Instructor.find(params[:id])
  end


  def create
    @instructor = Instructor.new(params[:instructor])
    render :action => :new unless @instructor.save
    @instructores = Instructor.all
  end


  def update
    @instructor = Instructor.find(params[:id])
    render :action => :edit unless @instructor.update_attributes(params[:instructor])
  end


  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    @instructores = Instructor.all
  end

  private
  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
