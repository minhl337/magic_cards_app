class StoreController < ApplicationController
<<<<<<< HEAD
    def home
        if current_customer
            @customer = Customer.find(current_customer)
        end
        @cards = Card.all
    end

    def login 
        @customer = Customer.new
        render 'loggin'
    end

    def check_login
        @customer = Customer.find_by(username: params[:customer][:username])
        @customer = @customer.try(:authenticate, params[:user][:password])
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
=======

>>>>>>> front_end
