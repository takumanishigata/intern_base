Rails.application.routes.draw do

  get "category/:category" => "posts#category"
  get 'comment/new'
  get 'comment/create'
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "/" => "posts#index"
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  resources :posts,:only => [:show,:new,:create,:edit,:update,:destroy] do
    resources :comment, :only => [:new,:create]
  end
  resources :users,:only => [:show,:new,:create,:edit,:update,:destroy]
end
