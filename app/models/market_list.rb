class MarketList < ApplicationRecord
    has_many :market_items, dependent: :destroy
    validates :name, presence: true, length: { minimum: 5, message: ' da lista deve conter no mínimo 5 caracteres' } 
end
