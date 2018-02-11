Rails.application.routes.draw do

  # GET /orders
  # GET /orders/:order_id
  resources :delivery_orders, path: 'orders', param: :order_id, only: [:index, :show]

  # GET /orders/:order_id/feedbacks
  # POST /orders/:order_id/feedbacks



end
