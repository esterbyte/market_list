class Item < ApplicationRecord
    validates :valor, presence: true
  end