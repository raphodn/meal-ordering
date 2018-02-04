class DeliveryOrdersController < ApplicationController

  # ---------------------------------------------------------------------
  # => CALLBACKS
  # ---------------------------------------------------------------------

  # before_action


  # ---------------------------------------------------------------------
  # => CONTROLLERS
  # ---------------------------------------------------------------------

  def index
    @orders = DeliveryOrder.all
    render json: @orders, root: 'orders'
  end

  def show
    @order = DeliveryOrder.includes(:order_items).find_by_order_id(params[:order_id])
    if @order
      render json: @order
    else
      render status: :not_found
    end
  end

end
