class VenuesController < ApplicationController
    before_action :set_venue, only: [:show, :edit, :update, :destroy]

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
    end
    
    def edit
    end

    def update
        @venue.update(venue_params)
        redirect_to venue_path(@venue)
    end

    def destroy
        @venue.destroy
        redirect_to venues_path
    end

    private

    def venue_params
        params.require(:venue).permit(:name, :city, :state, :crowd_capacity, :parking)
    end

    def set_venue
        @venue = Venue.find(params[:id])
    end

end
