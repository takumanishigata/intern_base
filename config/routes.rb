Rails.application.routes.draw do
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "/" => "posts#index"
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  resources :posts,:only => [:show,:new,:create,:destroy]
  resources :users,:only => [:show,:new,:create,:destroy]
end
