class FcomitesController < ApplicationController
  # GET /fcomites
  # GET /fcomites.json
  def index
    @fcomites = Fcomite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fcomites }
    end
  end

  # GET /fcomites/1
  # GET /fcomites/1.json
  def show
    @fcomite = Fcomite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fcomite }
    end
  end

  # GET /fcomites/new
  # GET /fcomites/new.json
  def new
    @fcomite = Fcomite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fcomite }
    end
  end

  # GET /fcomites/1/edit
  def edit
    @fcomite = Fcomite.find(params[:id])
  end

  # POST /fcomites
  # POST /fcomites.json
  def create
    @fcomite = Fcomite.new(params[:fcomite])

    respond_to do |format|
      if @fcomite.save
        format.html { redirect_to @fcomite, notice: 'Fcomite was successfully created.' }
        format.json { render json: @fcomite, status: :created, location: @fcomite }
      else
        format.html { render action: "new" }
        format.json { render json: @fcomite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fcomites/1
  # PUT /fcomites/1.json
  def update
    @fcomite = Fcomite.find(params[:id])

    respond_to do |format|
      if @fcomite.update_attributes(params[:fcomite])
        format.html { redirect_to @fcomite, notice: 'Fcomite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fcomite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fcomites/1
  # DELETE /fcomites/1.json
  def destroy
    @fcomite = Fcomite.find(params[:id])
    @fcomite.destroy

    respond_to do |format|
      format.html { redirect_to fcomites_url }
      format.json { head :no_content }
    end
  end
end
