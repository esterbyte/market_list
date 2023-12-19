class MarketItem < ApplicationRecord
  belongs_to :market_list
  validates :name, presence: true, length: { minimum: 2, message: ' do item deve conter no mínimo 2 caracteres'}
  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than: 0, message: ' deve ser maior que zero'}
end
