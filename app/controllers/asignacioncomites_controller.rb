class AsignacioncomitesController < ApplicationController
  
  def index
    @asignacioncomites = Asignacioncomite.all
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
    render :action => :new unless @asignacioncomite.save
  end

  def update
    @asignacioncomite = Asignacioncomite.find(params[:id])
    render :action => :edit unless @asignacioncomite.update_attributes(params[:asignacioncomite])
  end

  def destroy
    @asignacioncomite = Asignacioncomite.find(params[:id])
    @asignacioncomite.destroy
  end
end
