class ApplicationController < ActionController::Base
    
    def send_text?
        return true
    end

    def admin_only
        if !current_user.admin
            flash[:notice] = "Only admins can access that section of the site."
            redirect_to singers_path 
        end
    end

end
