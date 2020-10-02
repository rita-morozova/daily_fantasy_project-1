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

    def add_balance
        if !User.find(session[:user_id]).admin
            redirect_to '/'
        end
    end

    def post_balance
        user = User.find(params[:user][:user_id])
        user.update(balance: user.balance + params[:user][:balance].to_i)
        redirect_to users_path
    end

    def destroy
       @user.destroy
       redirect_to '/'
    end
    
  def users_contests
    @user = User.find(session[:user_id])
   end

    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
