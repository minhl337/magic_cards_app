class CreditCard < ApplicationRecord

    validates :full_name, presence: true
    validates :card_number, numericality: { only_integer: true}
    validates :card_number, length: { is: 16 }
    validates :expiration_date, numericality: { only_integer: true}
    validates :expiration_date, length: { is: 4 }
    validates :security_code, numericality: { only_integer: true}
    validates :security_code, length: { is: 3 }

    
end
