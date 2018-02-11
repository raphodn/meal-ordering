class DeliveryOrder < ApplicationRecord

  # ---------------------------------------------------------------------
  # => FIELDS
  # ---------------------------------------------------------------------

  # field :order_id, type: String
  # field :serving_datetime, type: DateTime


  # ---------------------------------------------------------------------
  # => RELATIONSHIPS
  # ---------------------------------------------------------------------

  has_many :order_items, dependent: :destroy
  has_one :feedback, as: :ratable


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
    # do timeslot instead ?? (10:00-10:30AM)
    self.serving_datetime.strftime('%I:%M%p')
  end

  def feedback_submitted
    !self.feedback.nil?
  end

end
