module BandsHelper

    def location
        if @band.city
            "#{@band.city}, #{@band.state}"
        else
            "Unknown"
        end
    end

end
