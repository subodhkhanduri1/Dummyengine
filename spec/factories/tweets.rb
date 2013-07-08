FactoryGirl.define do
  factory :tweet do |t|
    t.user_id { Faker::Array.rand(10) }
    t.message { Faker::Lorem.words(5) }
  end
end