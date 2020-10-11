class ConcertsController < ApplicationController
    before_action :set_band, only: [:new, :create]

    def index
        @bands = Band.all
        @venues = Venue.all
        if !params[:band].blank?
            @band = Band.find_by(name: params[:band])
            # @concerts = @band.concerts
        elsif !params[:venue].blank?
            @concerts = Concert.by_venue(params[:venue])
        elsif !params[:date].blank?
            @concerts = Concert.by_date(params[:date])
        elsif params[:band_id]
            band = Band.find_by_id(params[:band_id])
            @concerts = band.concerts
        else
            @concerts = Concert.all
        end
    end

    def new
        if logged_in?
            @concert = Concert.new
            @venue_id = params[:venue_id]
            @venue = Venue.new
        else
            flash[:error] = "You must be logged in to perform that action."
            redirect_to concerts_path
        end
    end

    def create
        @concert = Concert.new(concert_params)
        @concert.band = @band
        if @concert.save
            redirect_to concert_path(@concert)
        else
            flash[:error] = @concert.errors.full_messages
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
        if !params[:concert][:venue_id].empty? && params[:concert][:venue_attributes]
            render :edit
        else
            @concert.update(concert_params)
            if @concert.save
                redirect_to concert_path(@concert)
            else
                flash[:error] = @concert.errors.full_messages
                render :edit
            end
        end
    end

    def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy
        redirect_to band_concerts_path(@band)
    end

    private

    def concert_params
        params.require(:concert).permit(:date, :admission, :venue_id, venue_attributes: [:name, :location, :crowd_capacity, :parking])
    end

    def set_band
        @band = current_user.band if current_user
    end

end
