class CustomersController < ApplicationController

    skip_before_action :authenticated?, only: [:new, :create, :customer_params]

    def show

    end

    def new
        if flash[:error]
            @error = flash[:error].first
        end
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to root_path
        else 
            flash[:error] = @customer.errors.full_messages
            redirect_to new_customer_path
        end
    end

    private
    def customer_params
        params.require(:customer).permit(:username, :password, :password_confirmation)
    end
end
