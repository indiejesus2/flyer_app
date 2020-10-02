class SessionsController < ApplicationController

    def new
    end

    def create
        byebug
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to band_concerts_path(user.band)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to concerts_path
    end

end
