class BandsController < ApplicationController

    def index
        @bands = Band.all
    end

    def new
        @band = Band.new
    end

    def create
        @band = Band.create(band_params)
        if @band.save
            redirect_to band_concerts_path(@band)
        else
            flash[:error] = @band.errors.full_messages
            render :new
        end
    end

    def show
        @band = Band.find(params[:id])
    end

    def edit
        @band = Band.find(params[:id])
        if current_user.band != @band
             redirect_to band_path(@band)
        end
    end

    def update
        
        @band = Band.find(params[:id])
        if current_user.band = @band
            @band.update(band_params)
            redirect_to band_concerts_path(@band)
        else
            flash[:error] = @band.errors.full_messages
            render band_path(@band)
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
    end

    private

    def band_params
        params.require(:band).permit(:name, :genre)
    end

end
