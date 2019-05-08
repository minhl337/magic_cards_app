class CardsController < ApplicationController

    before_action :set_card
    skip_before_action :authenticated?, only: [:show, :set_card]
    def show
    end

    def add_to_cart

        quantity = params[:quantity].to_i if params[:quantity]
        quantity.times do 
            CardsShoppingCart.create(shopping_cart_id: current_customer.shopping_cart.id, card_id: @card.id)
        end
        if params[:commit] == "Check out now"
            redirect_to shopping_cart_path(@customer.shopping_cart)
        else
            redirect_to @card
        end
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
end
