class ShoppingCartsController < ApplicationController

    def show 
        @shopping_cart = ShoppingCart.find(params[:id])
    end

end
