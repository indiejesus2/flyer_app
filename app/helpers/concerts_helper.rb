module ConcertsHelper

    def band?
        if params[:band_id] 
            band = Band.find_by_id(params[:band_id])
        elsif params[:band] == "Band"
            band = current_user.band
        elsif params[:band]
            band = Band.find_by(name: params[:band])
        end
        if band.nil?
            "Concerts"
        else
            "#{band.name} Concerts"
        end
    end
            
end
