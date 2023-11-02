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
      flash[:success] = 'Lista criada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao criar a lista'
      render :new
    end
  end

  def update
    if @market_list.update(market_list_params)
      flash[:success] = 'Lista editada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar a lista'
      render :edit
    end
  end

  def destroy
    if @market_list.destroy
      flash[:success] = 'Lista de mercado excluída com sucesso.'
    else
      flash[:error] = 'Erro ao excluir a lista de mercado.'
    end
    redirect_to market_lists_path
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
end
