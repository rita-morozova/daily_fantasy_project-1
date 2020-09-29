class SessionsController < ApplicationController
    skip_before_action :require_login
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if !@user 
            flash[:message]= "User Not Found"
            redirect_to '/login'
        else
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end