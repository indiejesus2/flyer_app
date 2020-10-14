class UsersController < ApplicationController

    def new
        @user = User.new
        @user.band = Band.new
    end

    def create
        @user = User.new(user_params)
        @user.band = Band.new(name: params[:user][:band])
        byebug
        if @user.save && @user.band.save
            session[:user_id] = @user.id
            redirect_to edit_band_path(@user.band)
        else
            flash[:error] = @user.errors.full_messages or @user.band.errors.full_messages
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
