class ConcertsController < ApplicationController

    def new
        @concert = Concert.new
    end

    def create
        @concert = Concert.new

        if @concert.save
            render conert_part(@conert)
        else
            redirect_to :new
        end

    end
    
end
