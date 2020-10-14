class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to band_concerts_path(user.band)
        else
            flash[:error] = "Invalid Username/Password. Please try again."
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to concerts_path
    end

end
