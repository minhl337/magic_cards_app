class Purchase < ApplicationRecord
    belongs_to :card
    belongs_to :customer
    belongs_to :trade
end
