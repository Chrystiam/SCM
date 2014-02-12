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
    @queja = Queja.find(@asignacioncomite.quejaid)
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

  def update_aprendices

    @aprendices = Asignacioncomite.where(:programa_id => params[:programa_id], :estado_id => 4 )
    @fcomiteid = params[:fcomite_id]
    @fcomite = Fcomite.find(@fcomiteid)
    @tiempo_caso = @fcomite.tiempo_caso

    @comites = Comite.where(:fcomite_id => @fcomiteid)
    if @comites.count == 0
      @h = params[:hora]
    else
      @hora = @comites.last
      @ho = Time.now.strftime("%Y/%m/%d #{@hora.hora}").to_time
      tiempo_caso = @tiempo_caso.to_i * 60 
      @ho = @ho + tiempo_caso
      @h = @ho.strftime("%I:%M %p")
    end
    render :partial => "aprendices", :object => @aprendices
  end

  def crear_progra


    @aprendices = Asignacioncomite.where(:programa_id => params[:programa_id])
    @fcomiteid = params[:fcomite_id]
    @programaid = params[:programa_id]
    @hora = params[:horas]
    @horas = @hora.split(",")
    @ids = params[:ids].split(",").map {|s| s.to_i}
     i=0
    @aprendices.each do |aprendiz|

      @nombreasig = Asignacioncomite.find(@ids[i])
      Comite.create(:hora => @horas[i],:fcomite_id => @fcomiteid[0], :nombreapren => @nombreasig.nombres, :programa_id =>@programaid[0] , :ficha => @nombreasig.ficha, :asignacioncomite_id => @nombreasig.programa_id, :quejaid => @nombreasig.quejaid)   
      @nombreasig.estado_id = 5
      @nombreasig.save
      i+=1
    end
    redirect_to asignacioncomites_path
  end

  def observacion

    @asignacioncomite = Asignacioncomite.find(params[:id])
    @observacion = params[:observaciones]
    @asignacioncomite.observaciones = @observacion
    @asignacioncomite.save

    redirect_to asignacioncomites_path
  end


  def asignar
    @programas = Asignacioncomite.hash_programa
    @aprendices = Queja.all
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
