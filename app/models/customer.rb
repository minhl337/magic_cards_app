class Customer < ApplicationRecord
    has_many :purchases
    has_many :cards, through: :purchases

    has_one :shopping_cart
     
    belongs_to :store

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { in: 8..15}

    def shopping_cart_items
        
    end
end
