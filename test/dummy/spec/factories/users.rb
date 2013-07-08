require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.username { Faker::Name.first_name.to_s.downcase }
    f.password { "gjagfkksgsdf" }
  end
end