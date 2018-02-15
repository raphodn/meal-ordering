Rails.application.routes.draw do

  # > rails routes

  get 'seed', to: 'application#seed_db'

  # GET /orders
  # GET /orders/:order_id
  # GET /orders/:order_id/feedbacks
  # POST /orders/:order_id/feedbacks
  resources :delivery_orders, path: 'orders', param: :order_id, only: [:index, :show] do
    # resources :feedbacks, only: [:index, :create]
    member do
      resources :feedbacks, only: [:index, :create], as: 'delivery_order_feedbacks'
    end
  end

end
