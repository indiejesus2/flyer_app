module ApplicationHelper

    def my_band
        if !!current_user
            link_to "My Band", band_path(current_user.band)
        end
    end

    # def errors(flash)
    #     flash.keys.each do |type|
    #         flash[type]
    #     end
    # end
    


end
