class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
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
