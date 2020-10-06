class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.band = Band.find_or_create_by(name: params[:user][:band])
        if @user.save
            session[:user_id] = @user.id
            redirect_to edit_band_path(@user.band)
        else
            redirect_to '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
