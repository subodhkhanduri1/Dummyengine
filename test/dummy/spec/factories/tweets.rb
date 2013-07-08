require 'faker'

FactoryGirl.define do
  factory :tweet, :class => "Tweet::Tweet" do |t|
    t.user_id { 1 }
    t.message { Faker::Lorem.words(5) }
  end
end
