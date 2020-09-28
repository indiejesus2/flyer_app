class ConcertsController < ApplicationController

    def new
        @concert = Concert.new
        @venue_id = params[:venue_id]
    end

    def create
        @concert = Concert.new(concert_params)

        if @concert.save
            render concert_part(@concert)
        else
            redirect_to :new
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

end
