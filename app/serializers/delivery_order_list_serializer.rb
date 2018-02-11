class DeliveryOrderListSerializer < ActiveModel::Serializer

  attributes :id, :order_id, :delivery_date, :delivery_time, :feedback_submitted
  has_many :order_items, serializer: OrderItemSerializer

end
