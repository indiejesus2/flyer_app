module UsersHelper

    def band_value
            if @user.band
                @user.band.name
            else
                ""
            end
    end


    # def band
    #     self.band = Band.find_by_id(self.band_id)
    # end
end
