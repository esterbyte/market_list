require 'rails_helper'
 
RSpec.describe MarketList, type: :model do
  it "valid with the correct attributes" do
    market_list = MarketList.new(name: "Example List", market_date: Date.today)
    expect(market_list).to be_valid
  end
 
  it "not valid if it has a name shorter than 5 characters" do
    market_list = MarketList.new(name: "abcd", market_date: Date.today)
    expect(market_list).to_not be_valid
  end 
end