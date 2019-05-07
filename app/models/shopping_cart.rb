class ShoppingCart < ApplicationRecord

    belongs_to :customer
    has_and_belongs_to_many :cards

    def uniq_cards_quantity_hash
        hash = {}
        self.cards.each do |card|
           if hash[card] == nil
            hash[card] = 1
           else 
            hash[card] += 1
           end
        end
        hash
    end

    def make_purchase
        self.cards.each do |card|
        end
    end

    def puts_in_cart(id)
        CardsShoppingCart.create(shopping_cart_id: self.id, card_id: id)
    end
end
