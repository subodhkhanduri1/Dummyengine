require 'spec_helper'

describe Tweet do

  it 'should_have_a_valid_user' do
    user = FactoryGirl.build(:user)
    FactoryGirl.build(:tweet, user_id: user.id).should be_valid
  end

  it 'should_have_a_valid_message' do

  end

  it 'returns_a_valid_username' do

  end

  it 'returns_the_username_of_the_correct_author' do

  end

  it 'returns_a_valid_name' do

  end

  it 'returns_a_valid_name_that_belongs_to_atleast_one_users'

end