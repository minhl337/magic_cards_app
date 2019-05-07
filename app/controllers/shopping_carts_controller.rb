class ShoppingCartsController < ApplicationController

    def show 
        @shopping_cart = current_customer.shopping_cart
    end

end
