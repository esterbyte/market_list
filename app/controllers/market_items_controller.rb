class MarketItemsController < ApplicationController

    def new
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = MarketItem.new
    end
    
    def create
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = @market_list.market_items.create(market_item_params)

      redirect_to @market_list
    end
    
    def edit
        # lógica para 'edit'
    end
    
    def update
        # lógica para 'update'
    end
    
    def destroy
        # lógica para 'destroy'
    end
end
