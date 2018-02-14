class DeliveryOrdersController < ApplicationController

  # ---------------------------------------------------------------------
  # => CALLBACKS
  # ---------------------------------------------------------------------

  # before_action


  # ---------------------------------------------------------------------
  # => CONTROLLERS
  # ---------------------------------------------------------------------

  def index
    @orders = DeliveryOrder.includes([{ order_items: :meal }, :feedback]).order(serving_datetime: :desc).all
    render json: @orders, each_serializer: DeliveryOrderListSerializer
  end

  def show
    @order = DeliveryOrder.includes([{ order_items: :meal }, :feedback]).find_by_order_id(params[:order_id])
    if @order
      render json: @order, serializer: DeliveryOrderSerializer
    else
      render status: :not_found
    end
  end

end
