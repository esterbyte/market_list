class MarketItemsController < ApplicationController

    def new
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = MarketItem.new
    end
    
    def create
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = @market_list.market_items.new(market_item_params)
      @market_item.quantidade = params[:market_item][:quantidade]
      @market_item.save

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

    def show
      @market_list = MarketList.find(params[:market_list_id])
      @market_item = @market_list.market_items.find(params[:id])
    end

    private

  def market_item_params
    params.require(:market_item).permit(:name, :date)
  end
end
