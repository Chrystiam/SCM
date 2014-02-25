class UsersController < ApplicationController

  helper_method :sort_column, :sort_direction
 
  def index
    #numero de registro por pagina
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #buscador
    @users  = User.indexar(current_user.id).order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    
    #esta variable trae todos los registros para el pdf
    @a= User.all 
    output = UserList.new(@a,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "userList.pdf", :type => "application/pdf", 
        :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @users  }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
   @user = User.new
  end
 
  def edit
   @user = User.find(params[:id])
  end


  def create
   @user = User.new(params[:user])
   
    render :inicio unless @user.save
    @users = User.all
  end


  def update
   @user = User.find(params[:id])
   render :action => :edit unless @user.update_attributes(params[:user])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @users = User.all
  end

  #ordenamiento
  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end