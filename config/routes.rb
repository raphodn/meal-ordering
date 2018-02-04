Rails.application.routes.draw do

  resources :delivery_orders, path: 'orders', param: :order_id, only: [:index, :show]

end
