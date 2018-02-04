class OrderItem < ApplicationRecord

  # ---------------------------------------------------------------------
  # => FIELDS
  # ---------------------------------------------------------------------

  # field :serving_date, type: DateTime
  # field :quantity, type: Integer
  # field :unit_price, type: Integer


  # ---------------------------------------------------------------------
  # => RELATIONSHIPS
  # ---------------------------------------------------------------------

  belongs_to :meal
  belongs_to :delivery_order


  # ---------------------------------------------------------------------
  # => VALIDATIONS
  # ---------------------------------------------------------------------

  validates_presence_of :serving_date, :quantity, :unit_price

end
