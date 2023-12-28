require 'rails_helper'

RSpec.describe MarketListsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @market_lists ordered by market_date' do
      market_list1 = MarketList.create(name: 'Lista 1', market_date: Date.today)
      market_list2 = MarketList.create(name: 'Lista 2', market_date: Date.yesterday)

      get :index

      expect(response).to be_successful
      expect(assigns(:market_lists)).to eq([market_list1, market_list2])
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new market list and redirects to the index page' do
        post :create, params: { market_list: { name: 'Nova Lista', market_date: Date.tomorrow } }

        expect(response).to redirect_to(action: :index)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new market list and render the new page' do
        post :create, params: { market_list: { name: '', market_date: nil } }

        expect(response).to render_template(:new)
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    it 'updates market list and redirects to viewing page' do
      market_list = MarketList.create(name: 'Lista Antiga', market_date: Date.today)

      patch :update, params: { id: market_list.id, market_list: { name: 'Lista Atualizada' } }

      expect(response).to redirect_to(market_list)
      expect(flash[:success]).to eq("Lista 'Lista Atualizada' editada com sucesso")
      expect(market_list.reload.name).to eq('Lista Atualizada')
    end

    it 'render edit page in case of invalid parameters' do
      market_list = MarketList.create(name: 'Lista Antiga', market_date: Date.today)

      patch :update, params: { id: market_list.id, market_list: { name: '' } }

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes market list and redirects to index page' do
      market_list = MarketList.create(name: 'Lista a ser excluída', market_date: Date.today)

      delete :destroy, params: { id: market_list.id }

      expect(response).to redirect_to(market_lists_path)
      expect(flash[:success]).to eq("Lista 'Lista a ser excluída' excluída com sucesso.")
      expect { market_list.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET #new' do
    it 'render new market list page' do
      get :new

      expect(response).to render_template(:new)
      expect(assigns(:market_list)).to be_a_new(MarketList)
    end
  end

  describe 'GET #edit' do
    it 'renders market list edit page' do
      market_list = MarketList.create(name: 'Lista a ser editada', market_date: Date.today)

      get :edit, params: { id: market_list.id }

      expect(response).to render_template(:edit)
      expect(assigns(:market_list)).to eq(market_list)
    end
  end
end