require_dependency "tweet/application_controller"

module Tweet
  class FollowController < ApplicationController

    before_filter :authenticate

    def create
      if params[:commit]
        User.find(session[:user_id].to_i).followees << User.find(params[:following_id])
      end
      redirect_to params[:redirect_url] and return
    end

    def destroy
      if params[:commit]
        User.find(session[:user_id]).followees.destroy(User.find(params[:following_id]))
      end
      redirect_to params[:redirect_url] and return
    end

    def view_followers
      @user = User.find(session[:user_id])
      per_page = (params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15)?params[:per_page]:15
      page = (params[:page] && is_integer?(params[:page]) && params[:page].to_i>0)?params[:page]:1
      @followers = User.find(session[:user_id]).followers.paginate(per_page: per_page, page: page, order: 'created_at DESC')
    end

    def view_followees
      @user = User.find(session[:user_id])
      per_page = (params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15)?params[:per_page]:15
      page = (params[:page] && is_integer?(params[:page]) && params[:page].to_i>0)?params[:page]:1
      @followees = User.find(session[:user_id]).followees.paginate(per_page: per_page, page: page, order: 'created_at DESC')
    end
  end
end
