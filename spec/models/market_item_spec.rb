require 'rails_helper'

RSpec.describe MarketItem, type: :model do
  it "is not valid with a name shorter than 2 characters" do
    market_list = MarketList.new(name: "Example List", market_date: Date.today)
    market_item = MarketItem.new(name: "a", quantidade: 1, market_list: market_list)
    
    expect(market_item).to_not be_valid
    expect(market_item.errors[:name]).to include(" do item deve conter no mínimo 2 caracteres")
  end

  it "is valid with the correct attributes" do
    market_list = MarketList.new(name: "Example List", market_date: Date.today)
    market_item = MarketItem.new(name: "Example Item", quantidade: 1, market_list: market_list)
    
    expect(market_item).to be_valid
  end

  it "is not valid with a quantity less than 1" do
    market_list = MarketList.new(name: "Example List", market_date: Date.today)
    market_item = MarketItem.new(name: "Example Item", quantidade: 0, market_list: market_list)
    
    expect(market_item).to_not be_valid
    expect(market_item.errors[:quantidade]).to include("must be greater than 0")
  end
end
