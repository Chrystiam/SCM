class FcomitesController < ApplicationController

  def index
    @fcomites = Fcomite.all
  end

  def show
    @fcomite = Fcomite.find(params[:id])
  end

  def new
    @fcomite = Fcomite.new
  end

  def edit
    @fcomite = Fcomite.find(params[:id])
  end

  def create
    @fcomite = Fcomite.new(params[:fcomite])
    @fcomite.tipo = params[:tipo]
    render :action => :new unless @fcomite.save
    @fcomites = Fcomite.all
  end

  def update
    @fcomite = Fcomite.find(params[:id])
    @fcomite.tipo = params[:tipo]
    render :action => :edit unless @fcomite.update_attributes(params[:fcomite])
  end

  def destroy
    @fcomite = Fcomite.find(params[:id])
    Comite.where(:fcomite_id => @fcomite.id).destroy_all#destruir a los hijos 
    @fcomite.destroy
  end
  
end
