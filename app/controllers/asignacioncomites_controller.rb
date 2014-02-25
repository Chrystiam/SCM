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
    @programas = Programa.all
    @programaid = params[:programa_id]
    @aprendicesup = Asignacioncomite.where(:programa_id => @programaid, :estado_id => 4 )
    render :partial => "aprendicesco"
  end

  def update_programa

    @aprendicesup = Queja.all
    @coordinadorid = params[:coordinador_id]
    @programas = Programa.where(:coordinador_id => @coordinadorid)

    render :partial => "programas"
  end

  def asignar_hora
    @hora = params[:horas]
    @fcomiteid = params[:fcomite_id]
    @programaid = params[:programa_id]
    @ids = params[:ids].split(",").map {|s| s.to_i}
    @horas = @hora.split(",")
    i = 0
    @horas.each do |hora|
      if @ids[i] != 0
        @nombreasig = Asignacioncomite.find(@ids[i])
        Comite.create(:hora => hora,:fcomite_id => @fcomiteid[0], :nombreapren => @nombreasig.nombres, :programa_id =>@programaid[0] , :ficha => @nombreasig.ficha,:asignacioncomite_id => @nombreasig.id, :quejaid => @nombreasig.quejaid)   
        @nombreasig.estado_id = 5
        @nombreasig.save
        i+=1
      end
    
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
    @programas = Programa.all
    @aprendicesup = Queja.all
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
