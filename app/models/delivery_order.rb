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

  times = ['11:00AM', '11:30AM', '11:30AM', '12:00PM', '12:00PM', '12:30PM', '12:30PM', '1:00PM', '1:00PM', '1:30PM']
  time_slots = ['11:00-11:30AM', '11:30-12:00PM', '12:00-12:30PM', '12:30-1:00PM', '1:00-1:30PM']

  def delivery_date
    self.serving_datetime.strftime('%Y-%m-%d')
  end

  def delivery_time

    if (self.serving_datetime.hour < 11)
      return '11:00-11:30AM'
    elsif (self.serving_datetime.hour > 13)
      return '1:00-1:30PM'
    elsif
      # timeslot_start_minutes = (self.serving_datetime.min - (self.serving_datetime.min % 30)).to_s
      timeslot_start_minutes = (self.serving_datetime.min >= 30) ? '30' : '00'
      timeslot_start = self.serving_datetime.hour.to_s + ':' +  timeslot_start_minutes
      timeslot_end_hours = (timeslot_start_minutes === '30') ? (self.serving_datetime.hour + 1) : self.serving_datetime.hour
      timeslot_end_minutes = (timeslot_start_minutes === '30') ? '00' : '30'
      timeslot_end = timeslot_end_hours.to_s + ':' +  timeslot_end_minutes
      return timeslot_start + '-' + timeslot_end
    end
    # self.serving_datetime.localtime
    # self.serving_datetime.strftime('%I:%M%p')
  end

  def feedback_submitted
    !self.feedback.nil?
  end

end
