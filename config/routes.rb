  Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :market_lists
    root to: 'market_lists#index'
  end

