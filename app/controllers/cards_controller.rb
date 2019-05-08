class CardsController < ApplicationController

    before_action :set_card
    skip_before_action :authenticated?, only: [:show, :set_card]
    def show
    end

    def add_to_cart
        CardsShoppingCart.create(shopping_cart_id: current_customer.shopping_cart.id,card_id: @card.id)
        redirect_to shopping_cart_path(current_customer.shopping_cart)
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
end
