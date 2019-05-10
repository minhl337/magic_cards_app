class CardsController < ApplicationController

    before_action :set_card
    skip_before_action :authenticated?

    def show
    end

    def add_to_cart
        unless params[:quantity].blank?
            quantity = params[:quantity].to_i 
            quantity.times do 
                CardsShoppingCart.create(shopping_cart_id: @shopping_cart.id, card_id: @card.id)
            end
        end
        redirect_to @card
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
end
