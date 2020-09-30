class BandsController < ApplicationController

    def new
        @band = Band.new
    end

    def create
        @band = Band.create(band_params)
        if @band.save
            redirect_to band_concerts_path(@band)
        else
            render :new
        end
    end

    def show
        @band = Band.find(params[:id])
    end

    def edit
        @band = Band.find(params[:id])
    end
    
end
