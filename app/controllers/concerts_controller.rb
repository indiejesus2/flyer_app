class ConcertsController < ApplicationController
    before_action :set_band, only: [:new, :create, :update, :destroy]
    before_action :set_concert, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index, :show]

    def index
        @bands = Band.all
        @concerts = {}
        if !search_params.blank?
            if !search_params[:band].blank?
                band = Band.find(search_params[:band])
                @concerts = band.concerts.search(search_params).current_show
            else
                @bands.each do |band|
                    @concerts.merge!({"#{band.id}" => band.concerts.search(search_params).current_show })
                end
            end
        elsif params[:band_id]
            band = Band.find_by_id(params[:band_id])
            @concerts = band.concerts.current_show
            @past = band.concerts.past_show
        else
            @bands.each do |band|
                @concerts.merge!({"#{band.id}" => band.concerts.current_show})
            end
        end
    end

    def new
        @concert = Concert.new
        @venue_id = params[:venue_id]
    end

    def create
        @concert = @band.concerts.new(concert_params)
        if @concert.save
            redirect_to band_concert_path(@band, @concert)
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
            redirect_to band_concert_path(@band, @concert)
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
        band = Band.find_by(id: params[:band_id])
        if band.nil?
            redirect_to bands_path, alert: "Band not found."
        else
            @concert = band.concerts.find_by(id: params[:id])
            redirect_to concerts_path, alert: "Concert not found." if @concert.nil?
        end
    end

    def search_params
        params.permit(:band, :venue, :date)
    end

end
