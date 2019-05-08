class ShoppingCartsController < ApplicationController

    def show 
        @shopping_cart = current_customer.shopping_cart
    end

    def update
        quantity = params[:quantity].to_i
        current_customer.shopping_cart.change_card_quantity(params[:card_id], quantity)

        redirect_to current_customer.shopping_cart
    end
end
