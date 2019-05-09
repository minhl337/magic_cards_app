class PurchasesController < ApplicationController

    before_action :check_stock, only: [:shipping, :confirm_checkout]
    skip_before_action :clear_private_info

    def shipping
    end

    def set_shipping
        create_address
        redirect_to payment_path
    end

    def payment
    end

    def set_payment
        create_payment_info
<<<<<<< HEAD
        # redirect_to shipping_methods_path
=======
>>>>>>> shipping_combine
        create_shipping_method
        redirect_to review_purchase_path
    end

    # def shipping_methods
    # end

    # def set_shipping_method
<<<<<<< HEAD
    #     # create_shipping_method
    #     # redirect_to review_purchase_path
=======
    #     create_shipping_method
    #     redirect_to review_purchase_path
>>>>>>> shipping_combine
    # end

    def review_purchase
        set_checkout_info
    end

    ###Confirm check out button
    def confirm_checkout
        trade_id = Trade.create.id
        @card_quantity_hash.each do |card, quantity_in_cart|
            card_left_after_sold = card.quantity - quantity_in_cart
            card.update(quantity: card_left_after_sold)
            quantity_in_cart.times do 
                Purchase.create(card_id: card.id, customer_id: current_customer.id, trade_id: trade_id)
            end
        end
        CardsShoppingCart.where(shopping_cart_id: current_customer.shopping_cart.id).delete_all
        redirect_to confirmation_page_path
    end

    def confirmation_page
        set_checkout_info
    end

    private
<<<<<<< HEAD
    def check_stock
        @card_quantity_hash = @customer.shopping_cart.uniq_cards_quantity_hash
        @card_quantity_hash.each do |card, quantity_in_cart|
            if card.quantity < quantity_in_cart
                flash[:alert] = "Card '#{card.name}' has only #{card.quantity} in stock."
                @alert = flash[:alert]
                # redirect_to shopping_cart_path(@customer.shopping_cart)
                @shopping_cart = @customer.shopping_cart
                render 'shopping_carts/show'
            end
        end
    end 
=======
    
    def full_info
        session[:first_name] = params[:first_name]
        session[:last_name] = params[:last_name]
        session[:address] = params[:address]
        session[:city] = params[:city]
        session[:state] = params[:state]
        session[:postal_code] = params[:postal_code]
        session[:email] = params[:email]
        session[:phone_number] = params[:phone_number]

        session[:full_name] = params[:full_name]
        session[:card_number] = params[:card_number]
        session[:expiration_date] = params[:expiration_date]
        session[:security_code] = params[:security_code]
        
        session[:shipping_method] = params[:shipping_method]
    end
    
    
>>>>>>> shipping_combine
    def create_address
        session[:first_name] = params[:first_name]
        session[:last_name] = params[:last_name]
        session[:address] = params[:address]
        session[:city] = params[:city]
        session[:state] = params[:state]
        session[:postal_code] = params[:postal_code]
        session[:email] = params[:email]
        session[:phone_number] = params[:phone_number]
    end
    
    def create_payment_info
        session[:full_name] = params[:full_name]
        session[:card_number] = params[:card_number]
        session[:expiration_date] = params[:expiration_date]
        session[:security_code] = params[:security_code]
    end

    def create_shipping_method
        session[:shipping_method] = params[:shipping_method]
    end

    def set_checkout_info
        @shopping_cart = current_customer.shopping_cart
        @address_info = {
            first_name: session[:first_name],
            last_name: session[:last_name],
            address: session[:address],
            city: session[:city],
            state: session[:state],
            postal_code: session[:postal_code],
            email: session[:email],
            phone_number: session[:phone_number]
        }
        @payment_info = {
            full_name: session[:full_name],
            card_number: session[:card_number],
            expiration_date: session[:expiration_date],
            security_code: session[:security_code]
        }
        @shipping_method = session[:shipping_method]
    end
end
