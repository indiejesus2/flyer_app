class ConcertsController < ApplicationController
    before_action :set_band, only: [:new, :create]

    def index
        @concerts = Concert.all
    end

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

    def update
        @concert = Concert.find(params[:id])
        # byebug
        if !params[:concert][:venue_id].empty? && params[:concert][:venue_attributes]
            # byebug
            render :edit
        else
            @concert.update(concert_params)
            if @concert.save
                redirect_to concert_path(@concert)
            else
                render :edit
            end
        end
    end

    private

    def concert_params
        params.require(:concert).permit(:date, :admission, :venue_id, venue_attributes: [:name, :location, :crowd_capacity, :parking])
    end

    def set_band
        @band = Band.first
    end

end
