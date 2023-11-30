class MarketItem < ApplicationRecord
  belongs_to :market_list
  validates :name, presence: true, length: { minimum: 2 }
  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
