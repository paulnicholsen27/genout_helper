class SessionsController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to singers_path
        else
            flash[:message] = "Username and password do not match."
            render "login_form"
        end
    end

    def login_form
    
    end

    def logout
        session[:user_id] = nil
        redirect_to login_path

    end

end
