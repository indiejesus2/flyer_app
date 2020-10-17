class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_login
    
    def logged_in?
        !!session[:user_id]
    end
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    private 

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to perform that action."
            redirect_to concerts_path
        end
    end

end
