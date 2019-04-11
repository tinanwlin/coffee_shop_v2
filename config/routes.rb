Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :order_items
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end
  
  root "products#index"
end
