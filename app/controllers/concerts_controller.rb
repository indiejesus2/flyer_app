class ConcertsController < ApplicationController
    before_action :set_band

    def new
        @concert = Concert.new
        @venue_id = params[:venue_id]
    end

    def create
        @concert = Concert.new(concert_params)
        @concert.band = @band
        if @concert.save
            redirect_to concert_path(@concert)
        else
            render :new
        end

    end

    def show
        @concert = Concert.find(params[:id])
    end

    def edit
        @concert = Concert.find(params[:id])
        @venue_id = params[:venue_id]
    end

    private

    def concert_params
        params.require(:concert).permit(:date, :admission, :venue_id)
    end

    def set_band
        @band = Band.first
    end

end
