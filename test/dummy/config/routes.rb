Rails.application.routes.draw do

  mount Tweet::Engine => "/tweet"
end
