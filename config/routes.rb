  Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :market_lists
    root to: 'market_lists#index'
  end
  # get 'market_lists', to: 'market_lists#index'

  # post 'market_lists', to: 'market_lists#create'

 # patch 'market_lists/:id/update_item', to: 'market_lists#update_item'

 # delete 'market_lists/:id/delete_item', to: 'market_lists#delete_item'
# end

