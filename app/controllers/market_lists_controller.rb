class MarketListsController < ApplicationController
    def index
      @market_lists = MarketList.all
    end 
    
    def show
    @market_list = MarketList.find(params[:id])
    end  

    def create
      @market_list = MarketList.new(params.require(:market_list).permit(:name, :market_date))
  
      if @market_list.save
        flash[:success] = 'Lista criada com sucesso'
        redirect_to action: :index
      else
        flash[:error] = 'Erro ao criar a lista'
        render :new
      end
    end

    def update
      @market_list = MarketList.find(params[:id])
      @market_list.attributes = params.require(:market_list).permit(:name, :market_date)
  
      if @market_list.save
        flash[:success] = 'Lista editada com Sucesso'
        redirect_to action: :index
      else
        flash[:error] = 'Erro ao editar a lista'
        render :edit
      end
    end

    def destroy
      @market_list = MarketList.find(params[:id])
      @market_list.destroy
      redirect_to market_lists_path
    end

    def new
      @market_list = MarketList.new
    end

    def edit
      @market_list = MarketList.find(params[:id])
    end
  end
