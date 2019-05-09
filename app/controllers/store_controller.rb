class StoreController < ApplicationController

    skip_before_action :authenticated?

    def home
        
        @all_sets = Card.all_sets
        @cards = Card.search(params[:search], find_sets)
    end

    def login 
        redirect_to root_path if login?
        @alert = flash[:alert] if flash[:alert]
    end

    def check_login
        
        @customer = Customer.find_by(username: params[:username])
        @customer = @customer.try(:authenticate, params[:password])
        if @customer
            session[:user_id] = @customer.id
            redirect_to root_path
        else
            flash[:alert] = 'Username or Password is incorrect'
            redirect_to store_login_path
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end


    
    private
    
    def store_params
        params.require(:store).permit(:search)
    end

    def find_sets
        
        sets = params.values.select do |value|
            Card.all_sets.include?(value)
        end
        return nil if sets.empty?
        sets
    end
end
