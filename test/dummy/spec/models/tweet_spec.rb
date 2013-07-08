require 'spec_helper'

describe Tweet::Tweet do

  it 'should_have_a_valid_user' do
    user = FactoryGirl.create(:user)
    FactoryGirl.build(:tweet, user_id: user.id).should be_valid
  end

  it 'should_have_a_valid_message' do
    user = FactoryGirl.create(:user)
    FactoryGirl.build(:tweet, user_id: user.id).should be_valid
    FactoryGirl.build(:tweet, user_id: user.id, :message => nil).should_not be_valid
    FactoryGirl.build(:tweet, user_id: user.id, :message => "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghija").should_not be_valid
  end

  it 'returns_a_valid_username' do
    user = FactoryGirl.create(:user)
    expect(User.find_by_username(FactoryGirl.build(:tweet, user_id: user.id).username)).to eq(user)
  end

  it 'returns_a_valid_name' do
    user = FactoryGirl.create(:user)
    expect(User.find_by_name(FactoryGirl.build(:tweet, user_id: user.id).name)).to eq(user)
  end

end