module SessionsHelper

    def logged_in?
        return !!session[:user_id]
    end



end
