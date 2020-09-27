class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def new
        @venue = Venue.new
    end

    def create
        @venue = Venue.create(venue_params)
        redirect_to venues_path
    end

    def show
        @venue = Venue.find_by_id(params[:id])
    end

    private

    def venue_params
        params.require(:venue).permit(:name, :location, :crowd_capacity, :parking)
    end

end
