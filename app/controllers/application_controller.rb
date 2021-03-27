class ApplicationController < ActionController::Base
    
    def send_text?
        return false # TODO Fix this
    end

    # def authorized_only
    #     if !helpers.logged_in?
    #         flash[:message] = "Please login first"
    #         redirect_to login_path 
    #     end
    # end

end
