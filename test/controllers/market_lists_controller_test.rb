require 'test_helper'

class MarketListsControllerTest < ActiveSupport::TestCase
  setup do
    @market_list = market_lists(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  test "should get show" do
    get :show, params: { id: @market_list.id }
    assert_response :success
  end
end