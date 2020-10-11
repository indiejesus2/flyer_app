module VenuesHelper

    def street_parking?(venue)
        if venue.parking == true
            "On-site Parking"
        else
            "No Parking"
        end
    end

end
