class UsersController < ApplicationController

    before_action :admin_only

    def index
        if params[:approved] == "false"
            @users = User.where(approved: false)
        else
            @users = User.all
        end
    end

    def approve_user 
        user = User.find(params[:id])
        user.approved = !user.approved 
        user.save
        redirect_to approve_users_path
    end
    # def edit
    #     @user = User.find(params[:user])
    # end
end
