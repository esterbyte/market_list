class MarketList < ApplicationRecord
    has_many :market_items
    validates :name, presence: true, length: { minimum: 1 }
end
