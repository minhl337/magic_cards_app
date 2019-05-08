class Card < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_and_belongs_to_many :shopping_cart




    def self.search(search)
        if search
            cards = Card.all.select { |c| /#{search}/i.match(c.name) }
            # if cards >0
            #     self.where(id: cards[0].id)
             if cards
                 
                 @cards = cards
            
            
            else
                Card.all
            end
        else
            Card.all
        end
    end

    def add_to_cart(id)
        CardsShoppingCart.create(card_id: self.id, shopping_cart_id: id)
    end
end