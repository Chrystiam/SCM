class AsignacioncomitesController < ApplicationController
  # GET /asignacioncomites
  # GET /asignacioncomites.json
  def index
    @asignacioncomites = Asignacioncomite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asignacioncomites }
    end
  end

  # GET /asignacioncomites/1
  # GET /asignacioncomites/1.json
  def show
    @asignacioncomite = Asignacioncomite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asignacioncomite }
    end
  end

  # GET /asignacioncomites/new
  # GET /asignacioncomites/new.json
  def new
    @asignacioncomite = Asignacioncomite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asignacioncomite }
    end
  end

  # GET /asignacioncomites/1/edit
  def edit
    @asignacioncomite = Asignacioncomite.find(params[:id])
  end

  # POST /asignacioncomites
  # POST /asignacioncomites.json
  def create
    @asignacioncomite = Asignacioncomite.new(params[:asignacioncomite])

    respond_to do |format|
      if @asignacioncomite.save
        format.html { redirect_to @asignacioncomite, notice: 'Asignacioncomite was successfully created.' }
        format.json { render json: @asignacioncomite, status: :created, location: @asignacioncomite }
      else
        format.html { render action: "new" }
        format.json { render json: @asignacioncomite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asignacioncomites/1
  # PUT /asignacioncomites/1.json
  def update
    @asignacioncomite = Asignacioncomite.find(params[:id])

    respond_to do |format|
      if @asignacioncomite.update_attributes(params[:asignacioncomite])
        format.html { redirect_to @asignacioncomite, notice: 'Asignacioncomite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asignacioncomite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacioncomites/1
  # DELETE /asignacioncomites/1.json
  def destroy
    @asignacioncomite = Asignacioncomite.find(params[:id])
    @asignacioncomite.destroy

    respond_to do |format|
      format.html { redirect_to asignacioncomites_url }
      format.json { head :no_content }
    end
  end
end
