require_dependency "tweet/application_controller"

module Tweet
  class TweetController < ApplicationController

    before_filter :authenticate

    def show
      @user = current_user
      per_page = (params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15)?params[:per_page]:15
      page = (params[:page] && is_integer?(params[:page]) && params[:page].to_i>0)?params[:page]:1
      @tweets = Tweet.where(user_id: @user.followee_ids+[@user.id]).paginate(per_page: per_page, page: page, order: 'created_at DESC')
    end

    def create
      if params[:commit]
        @tweet = Tweet.new(:user_id => session[:user_id],:message => params[:tweet_message])
        @tweet.save
        session[:messages] = @tweet.errors.full_messages
        #end
        redirect_to tweet_index_path and return
      end
    end

    def index
      @user = current_user
      @tweets = Tweet.where(user_id: @user.followee_ids+[@user.id]).order("created_at DESC").limit(10)
      @no_of_tweets = Tweet.where(user_id: @user.followee_ids+[@user.id]).size
      @followers = @user.followers.order("created_at ASC").limit(5)
      @no_of_followers = @user.followers.size
      @followees = @user.followees.order("created_at DESC").limit(5)
      @no_of_followees = @user.followees.size
    end
  end
end
