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

    def total_price
        self.cards.map {|card| card.price.to_f}.sum
    end

    def change_card_quantity(card_id, quantity)
        join_class_arr = CardsShoppingCart.where("card_id = ? and shopping_cart_id = ?", card_id, self.id)
        join_class_arr.each do |join_class|
            join_class.destroy
        end
        quantity.times do 
            CardsShoppingCart.create(card_id: card_id, shopping_cart_id: self.id)
        end
    end
end