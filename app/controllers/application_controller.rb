class ApplicationController < ActionController::Base

    before_action :authenticated?, :current_customer

    def current_customer
        if !!session[:user_id]
            @customer = Customer.find(session[:user_id])
        end
    end

    def current_shopping_cart
        current_customer.shopping_cart
    end

    def login?
        !!current_customer
    end

    def authenticated?
        redirect_to store_login_path unless login?
    end
end
