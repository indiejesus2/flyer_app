module UsersHelper

    def band_value
            if @user.band
                @user.band.name
            else
                ""
            end
    end
    
end
