module UsersHelper

    def logged_in?
        !!session[:user_id]
    end
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        else
            byebug
            redirect_to '/login'
        end
    end
    def band
        self.band = Band.find_by_id(self.band_id)
    end
end
