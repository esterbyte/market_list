require 'rails_helper'

RSpec.describe MarketListsController, type: :controller do
  describe 'GET #index' do
    it 'atribui @market_lists ordenado por market_date' do
      market_list1 = MarketList.create(name: 'Lista 1', market_date: Date.today)
      market_list2 = MarketList.create(name: 'Lista 2', market_date: Date.yesterday)

      get :index

      expect(response).to be_successful
      expect(assigns(:market_lists)).to eq([market_list1, market_list2])
    end
  end

  describe 'POST #create' do
    context 'com parâmetros válidos' do
      it 'cria uma nova lista de mercado e redireciona para a página de índice' do
        post :create, params: { market_list: { name: 'Nova Lista', market_date: Date.tomorrow } }

        expect(response).to redirect_to(action: :index)
        expect(flash[:success]).to be_present
      end
    end

    context 'com parâmetros inválidos' do
      it 'não cria uma nova lista de mercado e renderiza a página de nova' do
        post :create, params: { market_list: { name: '', market_date: nil } }

        expect(response).to render_template(:new)
        expect(flash[:danger]).to be_present
      end
    end
  end
end