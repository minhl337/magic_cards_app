class CustomersController < ApplicationController

    skip_before_action :authenticated?, only: [:new, :create, :customer_params]
    def show

    end

    def new
        redirect_to root_path if login?
    end

    def create
        @customer = Customer.new(customer_attributes_hash)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to root_path
        else 
            flash[:error] = @customer.errors.full_messages.first
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
