Rails.application.routes.draw do
  get 'market_lists', to: 'market_lists#index'

  post 'market_lists', to: 'market_lists#create'

  patch 'market_lists/:id/update_item', to: 'market_lists#update_item'

  delete 'market_lists/:id/delete_item', to: 'market_lists#delete_item'
end

