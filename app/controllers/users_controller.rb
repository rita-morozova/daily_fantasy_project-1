class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new,:create]

    def index
        @users = User.rank_users
    end

    def show
        if @user.id != session[:user_id]
            redirect_to user_path(session[:user_id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors
            redirect_to new_user_path
        end
    end
    
    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors
            redirect_to edit_user_path
        end
    end

    def destroy
       @user.destroy
       redirect_to '/'
    end
    
    # def wishlist

    # end

    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
