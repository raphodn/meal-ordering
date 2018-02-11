class OrderItemSerializer < ActiveModel::Serializer

  # attributes :name, :quantity, :total_price
  attributes :order_item_id, :name

  def order_item_id
    object.id
  end

end
