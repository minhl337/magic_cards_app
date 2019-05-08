class ApplicationController < ActionController::Base

    before_action :authenticated?, :current_customer, :clear_private_info

    def current_customer
        if session[:user_id]
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

    def clear_private_info
        session[:first_name] = nil
        session[:last_name] = nil
        session[:address] = nil
        session[:city] = nil
        session[:state] = nil
        session[:postal_code] = nil
        session[:email] = nil
        session[:phone_number] = nil
        session[:full_name] = nil
        session[:card_number] = nil
        session[:expiration_date] = nil
        session[:security_code] = nil
        session[:shipping_method] = nil
    end
end
