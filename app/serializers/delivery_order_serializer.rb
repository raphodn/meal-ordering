class DeliveryOrderSerializer < ActiveModel::Serializer

  attributes :order_id, :delivery_date, :delivery_time, :feedback_submitted
  has_many :order_items, serializer: OrderItemSerializer

end
