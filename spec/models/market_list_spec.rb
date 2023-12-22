require 'rails_helper'
 
RSpec.describe MarketList, type: :model do
  it "e valido com os atributos corretos" do
    market_list = MarketList.new(name: "Example List", market_date: Date.today)
    expect(market_list).to be_valid
  end
 
  it "nao e valido se tiver um nome menor de 5 caracteres" do
    market_list = MarketList.new(name: "abcd", market_date: Date.today)
    expect(market_list).to_not be_valid
  end 
end