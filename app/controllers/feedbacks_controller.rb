class FeedbacksController < ApplicationController

  # ---------------------------------------------------------------------
  # => CALLBACKS
  # ---------------------------------------------------------------------

  # before_action


  # ---------------------------------------------------------------------
  # => CONTROLLERS
  # ---------------------------------------------------------------------

  # get list of Delivery Order & Order Item(s) Feedbacks
  def index
    @order = DeliveryOrder.includes([{ order_items: :feedback }, :feedback]).find_by_order_id(params[:order_id])
    if @order
      # DeliveryOrder feedback
      @delivery_order_feedback = @order.feedback ? [@order.feedback] : []
      # Order Item(s) Feedbacks
      @order_item_feedbacks = @order.order_items.map { |item| item.feedback }.compact
      # Concat them all
      @feedbacks = @delivery_order_feedback + @order_item_feedbacks
      render json: @feedbacks, each_serializer: FeedbackSerializer
    else
      render json: { message: 'Delivery Order not found' }, status: :not_found
    end
  end

  # create Delivery Order & Order Item(s) Feedbacks
  def create
    @order = DeliveryOrder.includes([{ order_items: :meal }, :feedback]).find_by_order_id(params[:order_id])
    if @order
      feedbacks = []
      params[:feedbacks].each do |f|
        feedback = Feedback.new(feedback_params(f))
        feedbacks << feedback if feedback.save
      end
      render json: feedbacks, status: 201
    else
      render status: :not_found
    end
  end


  private

  def feedback_params(feedback)
    feedback.permit(:ratable_id, :ratable_type, :rating, :comment)
  end

end
