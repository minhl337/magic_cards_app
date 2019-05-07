class CardsController < ApplicationController

    before_action :set_card
    skip_before_action :authenticated?, only: [:show, :set_card]
    def show
        #here is some comment blah
    end

    def add_to_cart
        
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
end
