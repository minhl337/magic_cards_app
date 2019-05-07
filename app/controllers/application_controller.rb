class ApplicationController < ActionController::Base

    before_action :authenticated?

    def current_customer
        if !!session[:user_id]
            Customer.find(session[:user_id])
        end
    end

    def login?
        !!current_customer
    end

    def authenticated?
        redirect_to root_path unless login?
    end
end
