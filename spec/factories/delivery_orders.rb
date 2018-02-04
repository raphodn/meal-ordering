FactoryBot.define do
  factory :delivery_order do
    order_id { Faker::Lorem.word }
    serving_datetime { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
