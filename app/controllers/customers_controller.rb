class CustomersController < ApplicationController

    skip_before_action :authenticated?, only: [:new, :create, :customer_params]

    def show

    end

    def new
        if flash[:error]
            @error = flash[:error].first
        end
    end

    def create
        @customer = Customer.new(customer_attributes_hash)
        if @customer.save
            session[:user_id] = @customer.id
            # session[:shopping_cart_id] = @customer.shopping_cart.id
            redirect_to root_path
        else 
            flash[:error] = @customer.errors.full_messages
            redirect_to new_customer_path
        end
    end

    private
    def customer_attributes_hash
        {username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation]}
    end
    def customer_params
        params.require(:customer).permit(:username, :password, :password_confirmation)
    end
end
