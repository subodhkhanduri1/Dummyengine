require 'spec_helper'

describe Tweet::Follow do

  it 'should_have_a_valid_follower_and_followee' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    FactoryGirl.build(:follow, follower_id: user1.id, following_id: user2.id).should be_valid
  end

  it 'should_not_have_inexistent_follower_or_followee' do
    FactoryGirl.build(:follow, follower_id: 999, following_id: 2375).should_not be_valid
    user = FactoryGirl.create(:user)
    FactoryGirl.build(:follow, follower_id: user.id, following_id: 2375).should_not be_valid
    FactoryGirl.build(:follow, follower_id: 999, following_id: user.id).should_not be_valid
  end

  it 'should_return_followers' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    FactoryGirl.create(:follow, follower_id: user1.id, following_id: user2.id).should be_valid
    FactoryGirl.create(:follow, follower_id: user2.id, following_id: user1.id).should be_valid
    user1.followers.should include user2
    user2.followers.should include user1
  end

  it 'should_return_followees' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    FactoryGirl.create(:follow, follower_id: user1.id, following_id: user2.id).should be_valid
    FactoryGirl.create(:follow, follower_id: user2.id, following_id: user1.id).should be_valid
    user1.followees.should include user2
    user2.followees.should include user1
  end

end