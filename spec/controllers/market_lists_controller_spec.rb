require 'rails_helper'

RSpec.describe MarketListsController, type: :controller do
    describe 'GET #index' do
      it 'atribui @market_lists ordenado por market_date' do
        market_list1 = create(:market_list, market_date: Date.today)
        market_list2 = create(:market_list, market_date: Date.yesterday)
  
        get :index
  
        expect(response).to be_successful
  
        expect(assigns(:market_lists)).to eq([market_list1, market_list2].sort_by(&:market_date).reverse)
      end
    end
  end