require 'rails_helper'

RSpec.describe MarketListsController, type: :controller do
    describe 'GET #index' do
      it 'atribui @market_lists ordenado por market_date' do
        market_list1 = MarketList.create(name: 'Lista 1', market_date: Date.today)
        market_list2 = MarketList.create(name: 'Lista 2', market_date: Date.yesterday)
  
        get :index
  
        expect(response).to be_successful
  
        expect(assigns(:market_lists)).to match_array([market_list2, market_list1])
      end
    end
  end
  
  