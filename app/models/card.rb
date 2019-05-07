class Card < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_and_belongs_to_many :shopping_cart


    def add_to_cart(id)
        CardsShoppingCart.create(card_id: self.id, shopping_cart_id: id)
    end
end