class DeliveryOrderSerializer < ActiveModel::Serializer

  attributes :order_id, :delivery_date, :delivery_time
  has_many :order_items, serializer: OrderItemSerializer

end
