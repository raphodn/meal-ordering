FactoryBot.define do
  factory :meal do
    name { Faker::Lorem.word }
    byline { Faker::Lorem.word }
  end
end
