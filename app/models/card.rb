class Card < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_and_belongs_to_many :shopping_cart
end