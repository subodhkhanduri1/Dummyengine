require_dependency "tweet/application_controller"

module Tweet
  class TweetController < ApplicationController
    def view_tweets
      if logged_in
        @user = User.find(session[:user_id])
        if params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15
          per_page = params[:per_page]
        else
          per_page = 5
        end
        if params[:page] && is_integer?(params[:page]) && params[:page].to_i>0
          page = params[:page]
        else
          page = 1
        end
        @tweets = Tweet.where(user_id: @user.followee_ids << @user.id).paginate(per_page: per_page, page: page, order: 'created_at DESC')
      else
        redirect_to "/user/login" and return
      end
    end

    def post_tweet
      if logged_in
        if params[:commit]
          #if(params[:tweet_message].to_s.length>200)
          # session[:message] = 'Tweet must not exceed 200 characters!'
          #else
          @tweet = Tweet.new(:user_id => session[:user_id],:message => params[:tweet_message])
          @tweet.save
          session[:messages] = @tweet.errors.full_messages
          #end
          redirect_to controller: :tweet, action: :home and return
        end
      else
        redirect_to "/user/login" and return
      end
    end

    def home
      if logged_in
        @user = User.find(session[:user_id])
        @tweets = Tweet.where(user_id: @user.followee_ids << @user.id).order("created_at DESC").limit(10)
        @no_of_tweets = Tweet.where(user_id: @user.followee_ids << @user.id).size
        @followers = @user.followers.order("created_at ASC").limit(5)
        @no_of_followers = @user.followers.size
        @followees = @user.followees.order("created_at DESC").limit(5)
        @no_of_followees = @user.followees.size
      else
        redirect_to "/user/login" and return
      end
    end
  end
end
