class CreateTweetFollows < ActiveRecord::Migration
  def change
    create_table :tweet_follows do |t|
      t.column :follower_id, :integer, :null => false
      t.column :following_id, :integer, :null => false
      t.timestamps
    end
  end
end
