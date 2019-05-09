class ShoppingCartsController < ApplicationController

    def show 
        @alert = flash[:error]
        @shopping_cart = @customer.shopping_cart
    end

    def update
        quantity = params[:quantity].to_i
        @customer.shopping_cart.change_card_quantity(params[:card_id], quantity)

        redirect_to @customer.shopping_cart
    end
end
