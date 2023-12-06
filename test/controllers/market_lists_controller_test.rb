require 'test_helper'

class MarketListsControllerTest < ActionController::TestCase
  test "índice atribui market_lists ordenado por market_date" do
    market_list1 = MarketList.create(market_date: Date.today)
    market_list2 = MarketList.create(market_date: Date.yesterday)

    get :index

    assert_response :success

    assert_not_nil assigns(:market_lists)
    assert_equal [market_list2, market_list1], assigns(:market_lists)
  end
end

