class ActasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    #numero de registro por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    
    #buscador
    @actas  = Acta.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)

  end


  def show
    @acta = Acta.find(params[:id])

    if params[:format] == "pdf"
      output = ActaList.new(@acta,view_context) # Aquí instancio el documento pdf
      respond_to do |format|
        format.pdf{
          send_data output.render, :filename => "Acta.pdf", :type => "application/pdf", 
          :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
        }
      end
    end
  end

  
  def new
    @acta = Acta.new
  end


  def edit
    @acta = Acta.find(params[:id])
  end


  def create
    @acta = Acta.new(params[:acta])
    render :action => :new unless @acta.save
    @actas = Acta.all
  end


  def update
    @acta = Acta.find(params[:id])
    render :action => :edit unless @acta.update_attributes(params[:acta])
  end


  def destroy
    @acta = Acta.find(params[:id])
    @acta.destroy
    @actas = Acta.all
  end


  def pdf_condicionamiento
    @acta = Acta.find(params[:id])
    @fechaes, @año = Comite.fechaes
    @queja = Queja.find(params[:idq])
    if params[:format] == "pdf"
      output = Condicionamiento.new(@acta,@queja,@fechaes, @año,view_context) # Aquí instancio el documento pdf
      respond_to do |format|
        format.pdf{
          send_data output.render, :filename => "Condicionamiento_de_matricula.pdf", :type => "application/pdf", 
          :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
        }
      end
    end
  end

  def pdf_cancelacion
      @acta = Acta.find(params[:id])
      @configuracion = Configuracion.find(@acta.configuracion_id)
      @fechaes, @año = Comite.fechaes
      @queja = Queja.find(params[:idq])
      output = Cancelacion.new(@acta,@configuracion,@queja,@fechaes, @año,view_context) # Aquí instancio el documento pdf
      respond_to do |format|
        format.pdf{
          send_data output.render, :filename => "Cancelacion de matricula.pdf", :type => "application/pdf", 
          :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
        }

      end
  end

  
  #ordenamiento
  private
  def sort_column
    Acta.column_names.include?(params[:sort]) ? params[:sort] : "fecha"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
