class CreditCard < ApplicationRecord
    belongs_to :customer

    validates :full_name, presence: true
    validates :last_name, presence: true
    validates :card_number, length: { is: 16 }
    validates :expiration_date, length: { is: 4 }
    validates :security_code, length: { is: 3 }

end
