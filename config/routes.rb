Rails.application.routes.draw do
  get "signup" => "users#new"
  resources :posts,:only => [:show,:index,:new,:create,:destroy]
  resources :users,:only => [:show,:new,:create,:destroy]
end
