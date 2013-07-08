require 'faker'

FactoryGirl.define do
  factory :follow, :class => "Tweet::Follow" do |t|
    t.follower_id { 1 }
    t.following_id { 2 }
  end
end