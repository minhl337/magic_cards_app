class ApplicationController < ActionController::Base

    def current_customer
        session[:user_id]
    end
end
