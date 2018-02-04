require 'rails_helper'

RSpec.describe Meal, type: :model do

  # Association test
  # ensure Meal model has a 1:m relationship with the OrderItem model
  it { should have_many(:order_items) }

  # Validation tests
  # ensure all columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:byline) }
end
