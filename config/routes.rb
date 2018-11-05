Rails.application.routes.draw do
  resources :posts,:only => [:show,:index,:new,:create,:destroy]
end
