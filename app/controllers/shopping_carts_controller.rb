class ShoppingCartsController < ApplicationController
    
    skip_before_action :authenticated?

    def show 
        @total = '%.2f' % @shopping_cart.total_price
    end

    def update
        quantity = params[:quantity].to_i
        @shopping_cart.change_card_quantity(params[:card_id], quantity)
        
        redirect_to @shopping_cart
    end

    def check_cart
        if @shopping_cart.cards.blank?
            flash[:error] = "Your Shopping Cart is Empty"
            redirect_to @shopping_cart
        elsif @shopping_cart.out_of_stock
            flash[:error] = @shopping_cart.out_of_stock[0]
            redirect_to @shopping_cart
        else
            redirect_to shipping_path
        end
    end
end
