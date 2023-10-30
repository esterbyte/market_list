class MarketItemsController < ApplicationController

    def new
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = MarketItem.new
    end
    
    def create
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = @market_list.market_items.new(market_item_params)
      redirect_to @market_list
    end
    
    def edit
        # lógica para 'edit'
    end
    
    def update
        # lógica para 'update'
    end
    
    def destroy
      @market_item = MarketItem.find(params[:id])
      @market_item.destroy
      redirect_to @market_item.market_list
    end

    def show
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = @market_list.market_items.find(params[:id])
    end

    private

  def market_item_params
    params.require(:market_item).permit(:name, :date)
  end
end
