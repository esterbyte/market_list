class MarketList < ApplicationRecord
    has_many :market_items
    validates :name, presence: true, length: { maximum: 5 }
end
