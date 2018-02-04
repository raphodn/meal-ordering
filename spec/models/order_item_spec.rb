require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  # Association test
  # ensure OrderItem model has a 1:m relationship with the OrderItem model
  it { should belong_to(:meal) }
  it { should belong_to(:delivery_order) }

  # Validation tests
  # ensure all columns are present before saving
  it { should validate_presence_of(:serving_date) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:unit_price) }
end
