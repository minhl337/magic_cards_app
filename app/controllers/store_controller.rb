class StoreController < ApplicationController

    skip_before_action :authenticated?

    def home
        if current_customer
            @customer = current_customer
        end
        @cards = Card.all
    end

    def login 
        render 'loggin'
    end

    def check_login
        
        @customer = Customer.find_by(username: params[:username])
        @customer = @customer.try(:authenticate, params[:password])
        if @customer
            session[:user_id] = @customer.id
            redirect_to root_path
        else
            redirect_to store_login_path
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end
end
