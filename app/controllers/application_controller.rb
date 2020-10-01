class ApplicationController < ActionController::Base
    before_action :require_login

    private

    def require_login
        redirect_to "/login" unless session.include? :user_id
    end

end
