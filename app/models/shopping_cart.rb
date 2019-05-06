class ShoppingCart < ApplicationRecord

    belongs_to :customer
    has_and_belongs_to_many :cards

    def puts_in_cart(id)
        CardsShoppingCart.create(shopping_cart_id: self.id, card_id: id)
    end
end
