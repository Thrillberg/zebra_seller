Rails.application.routes.draw do
  get '/login' => 'user_sessions#new'
  get '/logout' => 'user_sessions#destroy'

  resources :user_sessions
  resources :users do
    post '/toggle_zebra_seller' => 'users#update'
    patch '/toggle_zebra_seller' => 'users#update'
  end
  resources :shopping_carts do
    post :clear_cart
  end
  resources :products do
    post :add_to_cart
    post :remove_from_cart
  end

  root to: 'products#index'
end
