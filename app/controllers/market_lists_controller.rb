class MarketListsController < ApplicationController
    def index
       @items = ['Item 1', 'Item 2', 'Item 3']
    end   

    def create
        @item = Item.new(params.require(:item).permit(:valor))
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
    end
