Rails.application.routes.draw do
  root "products#index"
  
  resources :products
  resources :orders
  resources :order_items
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end
  
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
