class MarketList < ApplicationRecord
    has_many :market_items
    validates :name, presence: true, length: { minimum: 5, message: 'Nome da lista deve conter no mínimo 5 caracteres' } 
end
