class TiposDocumentosController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  def index
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    @tipos_documentos  = TipoDocumento.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    
  end

  
  def show
    @tipo_documento = TipoDocumento.find(params[:id])
  end

  
  def new
    @tipo_documento = TipoDocumento.new
  end

  
  def edit
    @tipo_documento = TipoDocumento.find(params[:id])
  end

  
  def create
    @tipo_documento = TipoDocumento.new(params[:tipo_documento])
    render :action => :new unless @tipo_documento.save
  end

  
  def update
    @tipo_documento = TipoDocumento.find(params[:id])
    render :action => :edit unless @tipo_documento.update_attributes(params[:tipo_documento])
  end

 
  def destroy
    @tipo_documento = TipoDocumento.find(params[:id])
    @tipo_documento.destroy
  end
  
  private
  def sort_column
    TipoDocumento.column_names.include?(params[:sort]) ? params[:sort] : "descripcion"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
