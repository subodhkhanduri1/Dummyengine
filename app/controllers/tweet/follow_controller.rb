require_dependency "tweet/application_controller"

module Tweet
  class FollowController < ApplicationController
    def create
      if logged_in
        if params[:commit]
          User.find(session[:user_id].to_i).followees << User.find(params[:following_id])
        end
        redirect_to params[:redirect_url] and return
      else
        redirect_to "/user/login" and return
      end
    end

    def delete
      if logged_in
        if params[:commit]
          User.find(session[:user_id]).followees.destroy(User.find(params[:following_id]))
        end
        redirect_to params[:redirect_url] and return
      else
        redirect_to "/user/login" and return
      end
    end

    def view_followers
      if logged_in
        @user = User.find(session[:user_id])
        if params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15
          per_page = params[:per_page]
        else
          per_page = 15
        end
        if params[:page] && is_integer?(params[:page]) && params[:page].to_i>0
          page = params[:page]
        else
          page = 1
        end
        @followers = User.find(session[:user_id]).followers.paginate(per_page: per_page, page: page, order: 'created_at DESC')
      else
        redirect_to "/user/login" and return
      end
    end

    def view_followees
      if logged_in
        @user = User.find(session[:user_id])
        if params[:per_page] && is_integer?(params[:per_page]) && params[:per_page].to_i>15
          per_page = params[:per_page]
        else
          per_page = 15
        end
        if params[:page] && is_integer?(params[:page]) && params[:page].to_i>0
          page = params[:page]
        else
          page = 1
        end
        @followees = User.find(session[:user_id]).followees.paginate(per_page: per_page, page: page, order: 'created_at DESC')
      else
        redirect_to "/user/login" and return
      end
    end
  end
end
