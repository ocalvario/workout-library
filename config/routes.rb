Rails.application.routes.draw do
  resources :reviews
  resources :exercises
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "hw#hello_world"
end
