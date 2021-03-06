class Address < ApplicationRecord

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :address, presence: true 
    validates :city, presence: true 
    validates :state, presence: true
    validates :postal_code, presence: true
    validates :postal_code, numericality: { only_integer: true}
    validates :postal_code, length: { is: 5 }
    validates :phone_number, presence: true
    validates :phone_number, numericality: { only_integer: true}
    validates :phone_number, length: { is: 10 }
    validate :is_email
    validates :email, presence: true



    def is_email
        if self.email
            if !self.email.include?('@')
                errors.add(:email, "Please enter a valid email")
            end
        end
    end

end
