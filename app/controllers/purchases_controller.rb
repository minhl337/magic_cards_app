class PurchasesController < ApplicationController

    before_action :check_empty_shopping_cart
    before_action :check_stock
    skip_before_action :check_empty_shopping_cart, only: [:confirmation_page]
    skip_before_action :authenticated?

    def shipping
    end

    def set_shipping
        create_address
        if address_valid?
            redirect_to payment_path
        else
            flash[:error] = @address.errors.full_messages.first
            redirect_to shipping_path
        end
    end

    def payment
    end

    def set_payment
        create_payment_info
        create_shipping_method
        if payment_valid?
            if params[:shipping_method].blank?
                flash[:error] = 'Please select a shipping method'
                redirect_to payment_path 
            else
                redirect_to review_purchase_path 
            end
        else
            flash[:error] = @payment.errors.full_messages.first
            redirect_to payment_path
        end
    end

    def review_purchase
        @total = total
        @shipping_days = shipping_days(session[:shipping_method])
    end

    ###Confirm check out button
    def confirm_checkout
        if !address_valid?
            flash[:error] = @address.errors.full_messages.first
            redirect_to shipping_path
        elsif !payment_valid?
            flash[:error] = @payment.errors.full_messages.first
            redirect_to payment_path
        elsif session[:shipping_method].blank?
            flash[:error] = 'Please select a shipping method'
            redirect_to payment_path
        else
            if login?
                user_checkout
            else
                guest_checkout
            end
            clear_private_info
        end
    end

    def confirmation_page
    end

    private

    def user_checkout 
        trade_id = Trade.create.id
        @card_quantity_hash.each do |card, quantity_in_cart|
            card_left_after_sold = card.quantity - quantity_in_cart
            card.update(quantity: card_left_after_sold)
            quantity_in_cart.times do 
                Purchase.create(card_id: card.id, customer_id: @customer.id, trade_id: trade_id)
            end
        end
        CardsShoppingCart.where(shopping_cart_id: @shopping_cart).delete_all
        redirect_to confirmation_page_path
    end

    def guest_checkout
        @card_quantity_hash.each do |card, quantity_in_cart|
            card_left_after_sold = card.quantity - quantity_in_cart
            card.update(quantity: card_left_after_sold)
        end
        CardsShoppingCart.where(shopping_cart_id: @shopping_cart).delete_all
        @shopping_cart.destroy
        redirect_to confirmation_page_path
    end

    def check_empty_shopping_cart
        if @shopping_cart.cards.blank?
            flash[:error] = "Your Shopping Cart is Empty"
            redirect_to @shopping_cart
        end
    end

    def check_stock
        @card_quantity_hash = @shopping_cart.uniq_cards_quantity_hash
        @card_quantity_hash.each do |card, quantity_in_cart|
            if card.quantity < quantity_in_cart
                flash[:error] = "Card '#{card.name}' has only #{card.quantity} in stock."
                redirect_to @shopping_cart
            end
        end
    end 

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

    def address_valid?
        @address = Address.new(
            first_name: session[:first_name],
            last_name: session[:last_name],
            address: session[:address],
            city: session[:city],
            state: session[:state],
            postal_code: session[:postal_code],
            email: session[:email],
            phone_number: session[:phone_number],
        )
        @address.valid?
    end

    def payment_valid?
        @payment = CreditCard.new(
            full_name: session[:full_name],
            card_number: session[:card_number],
            expiration_date: session[:expiration_date],
            security_code: session[:security_code]
        )
        @payment.valid?
    end

    def shipping_days(price)
        case price 
            when '0'
                'A week'
            when '15'
                'Two day'
            when '25'
                'Next day'
        end
    end

    #take a number and return '5.00' 2 decimal place string
    def total
        price = @shopping_cart.total_price + session[:shipping_method].to_f
        '%.2f' % price
    end
end
