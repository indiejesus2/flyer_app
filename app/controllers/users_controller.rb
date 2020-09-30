class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.band = Band.find_or_create_by(name: params[:user][:band])
        if @user.save
            # sessions[:user_id] = @user.id
            # sessions[:band] = @user.band.name
            redirect_to edit_band_path(@user.band)
        else
            render '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
