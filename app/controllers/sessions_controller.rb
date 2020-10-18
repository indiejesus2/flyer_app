class SessionsController < ApplicationController
    skip_before_action :require_login

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

    def google
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.email = auth['info']['email']
            u.uid = auth['uid']
        end
        if @user.persisted?
            session[:user_id] = @user.id
            redirect_to band_concerts_path(@user.band)
        else
            flash[:message] = "Complete Signup Form"
            render 'users/new'
        end
    end


    def destroy
        session.clear
        redirect_to concerts_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
