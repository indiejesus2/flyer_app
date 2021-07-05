class BandsController < ApplicationController
    before_action :find_band, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index, :show]


    def index
        @bands = Band.all.order(:name)
    end

    def show
    end

    def edit
        if current_user.band != @band
             redirect_to band_path(@band)
        end
    end

    def update
        if current_user.band = @band
            @band.update(band_params)
            redirect_to band_concerts_path(@band)
        else
            flash[:error] = @band.errors.full_messages
            render band_path(@band)
        end
    end

    def destroy
        @band.destroy
    end

    private

    def band_params
        params.require(:band).permit(:name, :genre, :city, :state)
    end

    def find_band
        @band = Band.find(params[:id])
    end

end
