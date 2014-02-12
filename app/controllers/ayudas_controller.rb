class AyudasController < ApplicationController

  def index
    @ayudas = Ayuda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ayudas }
    end
  end

  def download
    @ayuda = Ayuda.find(params[:id])
    send_file(@ayuda.archivo.path)
  end  

  def show
    @ayuda = Ayuda.find(params[:id])

  end

  def new
    @ayuda = Ayuda.new

  end
  
  def edit
    @ayuda = Ayuda.find(params[:id])
  end

  def create
    @ayuda = Ayuda.new(params[:ayuda])
    render :action => :new unless @ayuda.save

  end

  
  def update
    @ayuda = Ayuda.find(params[:id])
    render :action => :edit unless @ayuda.update_attributes(params[:ayuda])
  end
  
  def destroy
    @ayuda = Ayuda.find(params[:id])
    @ayuda.destroy
  end
end
