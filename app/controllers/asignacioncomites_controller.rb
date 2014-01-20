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
    @asignacioncomite.fecha = Asignacioncomite.splfecd(@asignacioncomite.created_at)
    render :action => :new unless @asignacioncomite.save
  end


  def asignar_hora

    @asignacioncomite = Asignacioncomite.find(params[:id])
    @fcomiteid = params[:fcomite_id]
    @hora = params[:hora]
    @comites = Comite.all
    if @comites.count == 0 then
      Comite.create(:hora => @hora,:fcomite_id => @fcomiteid[0], :nombreapren => @asignacioncomite.nombres, :programa_id => @asignacioncomite.programa_id, :ficha => @asignacioncomite.ficha)   
      @asignacioncomite.estado_id = 5
      @asignacioncomite.save

    else 
      @comite = Comite.find_by_hora(@hora)  
      if @comite 
        if @comite.hora == @hora
          @nombresal = "#{@comite.nombreapren}" + "#{@asignacioncomite.nombres}"
          @comite.nombreapren = @nombresal
          @comite.save
          @asignacioncomite.estado_id = 5
          @asignacioncomite.save
        end
      else
        Comite.create(:hora => @hora,:fcomite_id => @fcomiteid[0], :nombreapren => @asignacioncomite.nombres, :programa_id => @asignacioncomite.programa_id, :ficha => @asignacioncomite.ficha)   
        @asignacioncomite.estado_id = 5
        @asignacioncomite.save
      end  
      
    end

    redirect_to :asignacioncomites
    
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
