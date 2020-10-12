class ConcertsController < ApplicationController
    before_action :set_band, only: [:index, :new, :create, :update]
    before_action :logged_in, only: [:new, :create, :update]

    def index
        if !search_params.blank?
            @concerts = Concert.search(search_params).current_show
        elsif params[:band_id]
            band = Band.find_by_id(params[:band_id])
            @concerts = band.concerts.current_show
            @past = band.concerts.past_show
        else
            @concerts = Concert.all.current_show
        end
    end

    def new
        @concert = Concert.new
        @venue_id = params[:venue_id]
    end

    def create
        @concert = @band.concerts.new(concert_params)
        @concert.venue = Venue.create(concert_params[:venue_attributes])
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
        if params[:concert][:venue_id].empty? && params[:concert][:venue_attributes]
            flash[:error] = @concert.errors.full_messages
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
        params.require(:concert).permit(:date, :admission, :venue_id, venue_attributes: [:name, :city, :state, :crowd_capacity, :parking])
    end

    def set_band
        @band = current_user.band if current_user
    end

    def search_params
        params.permit(:band, :venue, :date)
    end

    def logged_in
        if !logged_in?
            flash[:error] = "You must be logged in to perform that action."
            redirect_to concerts_path
        end
    end

end
