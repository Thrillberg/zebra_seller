Rails.application.routes.draw do
  get '/login' => 'user_sessions#new'
  get '/logout' => 'user_sessions#destroy'

  resources :user_sessions
  resources :users
  resources :shopping_carts do
    post :clear_cart
  end
  resources :products do
    post :add_to_cart
    post :remove_from_cart
    post :add_to_inventory
    post :remove_from_inventory
  end

  root to: 'products#index'
end
