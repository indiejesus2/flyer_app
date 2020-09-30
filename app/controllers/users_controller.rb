class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.band = Band.find_or_create_by(name: params[:user][:band])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
