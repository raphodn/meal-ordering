class DeliveryOrderListSerializer < ActiveModel::Serializer

  attributes :order_id, :delivery_date, :delivery_time

end
