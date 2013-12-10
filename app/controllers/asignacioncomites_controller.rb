class AsignacioncomitesController < ApplicationController
  
  def index
    @asignacioncomites = Asignacioncomite.search(params[:search]).page(params[:page]).per_page(2)
    if params[:search]
      @searc = params[:search]
    else
      @searc = ""
    end  
  end

  def show
    @asignacioncomite = Asignacioncomite.find(params[:id])
  end

  def new
    @asignacioncomite = Asignacioncomite.new
  end

  def edit
    @asignacioncomite = Asignacioncomite.find(params[:id])
  end

  def create
    @asignacioncomite = Asignacioncomite.new(params[:asignacioncomite])
    
    if @asignacioncomite.save
      @asignacioncomite.fecha = Asignacioncomite.splfecd(@asignacioncomite.created_at)
    end

    render :action => :new unless @asignacioncomite.save
  end

  def update
    @asignacioncomite = Asignacioncomite.find(params[:id])
    @asignacioncomite.fecha = Asignacioncomite.splfecd(@asignacioncomite.created_at)
    render :action => :edit unless @asignacioncomite.update_attributes(params[:asignacioncomite])
  end

  def destroy
    @asignacioncomite = Asignacioncomite.find(params[:id])
    @asignacioncomite.destroy
  end
end
