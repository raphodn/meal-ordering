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


  # ---------------------------------------------------------------------
  # => METHODS
  # ---------------------------------------------------------------------

  def total_price
    self.quantity * self.unit_price
  end

  def name
    self.meal.name
  end

end
