Tweet::Engine.routes.draw do

  root to: "tweet#home"
=begin
  resource :tweet do
    member do
      get 'tweet/post_tweet', :to => 'tweet#post_tweet'
      get 'tweet/home', :to => 'tweet#home'
      get 'tweet/view_tweets', :to => 'tweet#view_tweets'
    end
  end

  resource :follow do
    member do
      get 'follow/view_followers', :to => 'follow#view_followers'
      get 'follow/view_followees', :to => 'follow#view_followees'
      get 'follow/create', :to => 'user#create'
      get 'follow/delete', :to => 'user#delete'
    end
  end
=end

  match 'tweet/post_tweet', :to => 'tweet#post_tweet'
  match 'tweet/home', :to => 'tweet#home'
  match 'tweet/view_tweets', :to => 'tweet#view_tweets'

  match 'follow/view_followers', :to => 'follow#view_followers'
  match 'follow/view_followees', :to => 'follow#view_followees'
  match 'follow/create', :to => 'follow#create'
  match 'follow/delete', :to => 'follow#delete'

=begin
    match '/user/login', :to => 'user#login'
    match '/user/home', :to => 'user#home'
    match '/user/profile', :to => 'user#profile'
    match '/user/logout', :to => 'user#logout'
    match '/user/sign_up', :to => 'user#sign_up'
    match '/user/edit_profile', :to => 'user#edit_profile'
    match '/user/change_password', :to => 'user#change_password'
    match '/user/change_name', :to => 'user#change_name'

    match '/user/all_users', :to => 'user#all_users'
    match '/follow/create', :to => 'follow#create'
    match '/follow/delete', :to => 'follow#delete'

#match '/', :to => 'user#login'

=end

end
