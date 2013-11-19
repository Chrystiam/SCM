class FuncionariosController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  def index
    #numero de registros por paginas
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @funcionarios  = Funcionario.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
  end

  
  def show
    @funcionario = Funcionario.find(params[:id])
  end


  def new
    @funcionario = Funcionario.new
  end


  def edit
    @funcionario = Funcionario.find(params[:id])
  end


  def create
    @funcionario = Funcionario.new(params[:funcionario])
    render :action => :new unless @funcionario.save
    @funcionarios = Funcionario.all
  end

 
  def update
    @funcionario = Funcionario.find(params[:id])
    render :action => :edit unless @funcionario.update_attributes(params[:funcionario])
  end

  
  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy
    @funcionarios = Funcionario.all
  end
  
  #ordenamiento
  private
  def sort_column
    Funcionario.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
