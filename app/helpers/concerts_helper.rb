module ConcertsHelper

    def band?
        if params[:band_id] 
            band = Band.find_by_id(params[:band_id])
            "#{band.name} Concerts"
        elsif params[:band]
            band = Band.find_by(name: params[:band])
            "#{band.name} Concerts"
        else
            "Concerts"
        end
    end
            
end
