FactoryBot.define do
  factory :order_item do
    meal_id nil
    delivery_order_id nil
    serving_date { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    quantity nil
    unit_price nil
  end
end
