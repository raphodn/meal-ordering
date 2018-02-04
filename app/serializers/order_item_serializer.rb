class OrderItemSerializer < ActiveModel::Serializer

  attributes :name, :quantity, :total_price
  # belongs_to :meal

end
