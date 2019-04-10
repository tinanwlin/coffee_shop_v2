Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :order_items
  resource :cart, only: [:show]
  root "products#index"
end
