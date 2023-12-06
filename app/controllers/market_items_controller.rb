class MarketItemsController < ApplicationController
  before_action :set_market_list, only: [:new, :create, :show, :destroy]
  before_action :set_market_item, only: [:show, :destroy]
 
  def new
    @market_item = MarketItem.new
  end
  
  def create
    @market_item = @market_list.market_items.new(market_item_params)
  
    if @market_item.save
      flash[:success] = "Item '#{@market_item.name}' criado com sucesso."
      redirect_to @market_list
    else
      flash[:danger] = market_item_errors
      render :new
    end
  end
  
  
  def destroy
    if @market_item.destroy
      flash[:success] = "Item '#{@market_item.name}' excluído com sucesso."
    else
      flash[:danger] = failed_destroy_message
    end
    
    redirect_to @market_item.market_list
  end

  def show
    # Já configurado no before_action set_market_item
  end

  private

  def failed_destroy_message
    "Erro ao excluir o item de mercado: #{market_item_errors}"
  end

  def set_market_list
    @market_list = MarketList.find(params[:market_list_id])
  end

  def set_market_item
    @market_item = @market_list.market_items.find(params[:id])
  end

  def market_item_params
    params.require(:market_item).permit(:name, :quantidade)
  end

  def market_item_errors
    @market_item.errors.full_messages.join(', ')
  end
end

