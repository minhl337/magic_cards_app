class Customer < ApplicationRecord
    has_many :purchases
    has_many :cards, through: :purchases

    has_one :shopping_cart
     
    belongs_to :store

    def shopping_cart_items
        
    end
end
