class SessionsController < ApplicationController
    skip_before_action :require_login
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        if !@user
            redirect_to '/login'
        else
            redirect_to '/'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end