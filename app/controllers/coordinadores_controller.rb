class CoordinadoresController < ApplicationController
 
  before_filter  :find_centro_and_coordinador

  def index
    @coordinadores = @centro.coordinadores.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coordinadores }
    end
  end

  def show
  end

  def new
    @coordinador = Coordinador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coordinador }
    end
  end

  def edit
  end

  def create
    @coordinador = @centro.coordinadores.build(params[:coordinador])

    
    @coordinador.save
    redirect_to centro_coordinadores_path
       
  end

  def update

    respond_to do |format|
      if @coordinador.update_attributes(params[:coordinador])
        format.html { redirect_to @coordinador, notice: 'Coordinador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coordinador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coordinador.destroy
    redirect_to  centro_coordinadores_path 
  end

  private
  def find_centro_and_coordinador
    @centro = Centro.find(params[:centro_id])
    @coordinador = Coordinador.find(params[:id]) if params[:id]
  end
end
