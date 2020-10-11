class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to band_concerts_path(user.band)
        elsif user.nil?
            byebug
            flash[:error] = "User Not Found"
            render :new
        else
            flash[:error] = "Invalid Password"
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to concerts_path
    end

end
