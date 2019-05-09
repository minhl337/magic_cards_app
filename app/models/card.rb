class Card < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_and_belongs_to_many :shopping_cart

    #sets array
    def self.all_sets
        Card.all.group(:set_name).count.keys
    end

    def self.search(search, certain_sets)
        cards = []
        certain_sets ? cards = self.find_cards_in(certain_sets) : cards = Card.all
        if search.blank?
            @cards = cards
        else
            searched_cards = cards.select { |c| /#{search}/i.match(c.name) }
            if searched_cards.empty?
                @cards = []
            else
                @cards = searched_cards
            end
        end
    end

    #sets is array of set_name
    def self.find_cards_in(sets)
        self.all.select do |card|
            sets.include?(card.set_name)
        end
    end
end