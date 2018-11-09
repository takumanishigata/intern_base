Rails.application.routes.draw do
  get "/" => "posts#index"
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  resources :posts,:only => [:show,:new,:create,:destroy]
  resources :users,:only => [:show,:new,:create,:destroy]
end
