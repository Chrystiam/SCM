class SessionsController < ApplicationController
    def new
    end

    def create
        #email
        user = login(params[:username],params[:password],params[:remember_me])
        if user
            redirect_back_or_to quejas_path
        else
            flash.now.alert = "El email o el password es invalido"
            render :new        
        end
    end

    def destroy
        logout
        redirect_to root_path
    end
end
