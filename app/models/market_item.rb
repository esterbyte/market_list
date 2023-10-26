class MarketItem < ApplicationRecord
  belongs_to :market_list
  validates :name, presence: true, length: { minimum: 1 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
