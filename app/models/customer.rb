class Customer < ApplicationRecord
    has_many :purchases
    has_many :cards, through: :purchases
    has_one :shopping_cart
    belongs_to :store

    after_create :create_shopping_cart

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { in: 8..15}
    validates :password, length: { in: 8..15}

    def shopping_cart_items
        
    end

    private
    def create_shopping_cart
        ShoppingCart.create(customer_id: self.id)
    end
end
