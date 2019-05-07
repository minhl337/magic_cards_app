class StoreController < ApplicationController
    
    def index
        @cards = Card.all
    end
    
end
