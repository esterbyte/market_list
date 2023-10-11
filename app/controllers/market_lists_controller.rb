class MarketListsController < ApplicationController
    def index
      @items = MarketList.all
    end   

    def create
      @item = MarketList.new(name: params[:name])
      # @item = Item.new(params.require(:item).permit(:valor))
    end

    def update_item
      @item = Item.find(params[:id])
      @item.update(params.require(:item).permit(:valor))
    end      

    def delete_item
      @item = Item.find(params[:id])
      @item.destroy
      head :no_content
    end

    def new
      @market_list = MarketList.new
    end
  end
