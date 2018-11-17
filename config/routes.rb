Rails.application.routes.draw do

  post "/posts/:post_id/comment/:id" => "comment#update"
  get "category/:category" => "posts#category"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "/" => "posts#index"
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  resources :posts,:only => [:show,:new,:create,:edit,:update,:destroy] do
    resources :comment, :only => [:new,:create,:edit,:update,:destroy]
  end
  resources :users,:only => [:show,:new,:create,:edit,:update,:destroy]
end
