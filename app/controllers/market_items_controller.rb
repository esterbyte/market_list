class MarketItemsController < ApplicationController


  def new
    @market_list = MarketList.find(params[:market_list_id])
    @market_item = MarketItem.new
  end
  
  def create
    @market_list = MarketList.find(params[:market_list_id])
    @market_item = @market_list.market_items.new(market_item_params)

    if @market_item.save
      flash[:success] = 'Item de mercado criado com sucesso.'     
    else
      flash[:error] = 'Erro ao criar o item de mercado.'
    end

    redirect_to @market_list
  end
  
  def destroy
    @market_item = MarketItem.find(params[:id])
    
    if @market_item.destroy
      flash[:success] = 'Item de mercado excluído com sucesso.'
    else
      flash[:error] = 'Erro ao excluir o item de mercado.'
    end
    
    redirect_to @market_item.market_list

  def show
    @market_list = MarketList.find(params[:market_list_id])
    @market_item = @market_list.market_items.find(params[:id])
  end

  private

  def market_item_params
    params.require(:market_item).permit(:name, :quantidade)
  end
end
