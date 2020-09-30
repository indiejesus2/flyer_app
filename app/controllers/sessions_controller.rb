class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            render band_path(@user.band)
        else
            render login_path
        end
    end

    def destroy
        session.clear
        redirect_to concerts_path
    end

end
