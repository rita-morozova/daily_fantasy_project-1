class ApplicationController < ActionController::Base
    before_action :require_login

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
