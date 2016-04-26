Rails.application.routes.draw do
  get '/login' => 'user_sessions#new'
  get '/logout' => 'user_sessions#destroy'

  resources :user_sessions
  resources :users
  resources :shopping_carts
  resources :products do
    post :add_to_cart
  end

  root to: 'products#index'
end
