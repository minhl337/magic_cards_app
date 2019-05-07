class CardsController < ApplicationController

    before_action :set_card

    def show
        
    end

    def add_to_cart
        
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
end
