class CoordinadoresController < ApplicationController
  # GET /coordinadores
  # GET /coordinadores.json
  def index
    @coordinadores = Coordinador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coordinadores }
    end
  end

  # GET /coordinadores/1
  # GET /coordinadores/1.json
  def show
    @coordinador = Coordinador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coordinador }
    end
  end

  # GET /coordinadores/new
  # GET /coordinadores/new.json
  def new
    @coordinador = Coordinador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coordinador }
    end
  end

  # GET /coordinadores/1/edit
  def edit
    @coordinador = Coordinador.find(params[:id])
  end

  # POST /coordinadores
  # POST /coordinadores.json
  def create
    @coordinador = Coordinador.new(params[:coordinador])

    respond_to do |format|
      if @coordinador.save
        format.html { redirect_to @coordinador, notice: 'Coordinador was successfully created.' }
        format.json { render json: @coordinador, status: :created, location: @coordinador }
      else
        format.html { render action: "new" }
        format.json { render json: @coordinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coordinadores/1
  # PUT /coordinadores/1.json
  def update
    @coordinador = Coordinador.find(params[:id])

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

  # DELETE /coordinadores/1
  # DELETE /coordinadores/1.json
  def destroy
    @coordinador = Coordinador.find(params[:id])
    @coordinador.destroy

    respond_to do |format|
      format.html { redirect_to coordinadores_url }
      format.json { head :no_content }
    end
  end
end
