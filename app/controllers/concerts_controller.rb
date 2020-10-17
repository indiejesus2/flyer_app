class ConcertsController < ApplicationController
    before_action :set_band, only: [:new, :create, :update, :destroy]
    before_action :set_concert, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index, :show]

    def index
        if !search_params.blank?
            @concerts = Concert.search(search_params).current_show
        elsif params[:band_id]
            band = Band.find_by_id(params[:band_id])
            @concerts = band.concerts.current_show
            @past = band.concerts.past_show
        end
    end

    def new
        @concert = Concert.new
        @venue_id = params[:venue_id]
    end

    def create
        @concert = @band.concerts.new(concert_params)
        if @concert.save
            redirect_to concert_path(@concert)
        else
            flash.now[:error] = @concert.errors.full_messages
            render :new
        end
    end

    def show
    end

    def edit
        @venue_id = params[:venue_id]
    end

    def update
        @concert.update(concert_params)
        if @concert.save
            redirect_to concert_path(@concert)
        else
            flash[:error] = @concert.errors.full_messages
            render :edit
        end
    end

    def destroy
        @concert.destroy
        redirect_to band_concerts_path(@band)
    end

    private

    def concert_params
        params.require(:concert).permit(:date, :admission, :venue_id, venue_attributes: [:name, :city, :state, :crowd_capacity, :parking])
    end

    def set_band
        @band = current_user.band if current_user
    end

    def set_concert
        @concert = Concert.find(params[:id])
    end

    def search_params
        params.permit(:band, :venue, :date)
    end

end
