class MarketListsController < ApplicationController
  before_action :set_market_list, only: [:show, :edit, :update, :destroy]

  def index
    @market_lists = MarketList.order(market_date: :desc)
  end 
  
  def show
    # Já configurado no before_action set_market_list
  end  

  def create
    @market_list = MarketList.new(market_list_params)

    if @market_list.save
      flash[:success] = "Lista '#{@market_list.name}' criada com sucesso"
      redirect_to action: :index
    else
      set_flash_error
      render :new
    end
  end

  def update
    if @market_list.update(market_list_params)
      flash[:success] = "Lista '#{@market_list.name}' editada com sucesso"
      redirect_to @market_list
    else
      set_flash_error
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @market_list.destroy
      flash[:success] = "Lista '#{@market_list.name}' excluída com sucesso."
    else
      set_flash_error
      redirect_to market_lists_path
    end
  end

  def new
    @market_list = MarketList.new
  end

  def edit
    # Já configurado no before_action set_market_list
  end

  private

  def set_market_list
    @market_list = MarketList.find(params[:id])
  end

  def market_list_params
    params.require(:market_list).permit(:name, :market_date)
  end

  def set_flash_error
    flash[:danger] = @market_list.errors.full_messages.join(', ')
  end
end
