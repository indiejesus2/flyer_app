module ConcertsHelper

    def band?
        if params[:band_id] 
            band = Band.find_by_id(params[:band_id])
        elsif params[:band]
            band = Band.find_by_id(params[:band])
        end
        band.name if band
    end
            
    def free?(concert)
        if concert.admission == 0 || concert.admission.nil?
            "Free"
        else
            "$#{concert.admission}"
        end
    end

end
