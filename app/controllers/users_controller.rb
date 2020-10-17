class UsersController < ApplicationController
    skip_before_action :require_login


    def new
        @user = User.new
        @user.band = Band.new
    end

    def create
        @user = User.new(user_params)
        @user.band = Band.new(name: params[:user][:band])
        if @user.save
            session[:user_id] = @user.id
            redirect_to edit_band_path(@user.band)
        else
            flash[:error] = @user.errors.full_messages
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :uid)
    end

end
