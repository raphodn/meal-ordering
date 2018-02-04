class DeliveryOrder < ApplicationRecord

  # ---------------------------------------------------------------------
  # => FIELDS
  # ---------------------------------------------------------------------

  # field :order_id, type: String
  # field :serving_datetime, type: DateTime


  # ---------------------------------------------------------------------
  # => RELATIONSHIPS
  # ---------------------------------------------------------------------

  has_many :order_items


  # ---------------------------------------------------------------------
  # => VALIDATIONS
  # ---------------------------------------------------------------------

  validates_presence_of :order_id, :serving_datetime


  # ---------------------------------------------------------------------
  # => METHODS
  # ---------------------------------------------------------------------

  def delivery_date
    self.serving_datetime.strftime('%Y-%m-%d')
  end

  def delivery_time
    self.serving_datetime.strftime('%I:%M%p')
  end

end
