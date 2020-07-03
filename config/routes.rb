Rails.application.routes.draw do
  
  #root_route
    root to: 'application#home'

  resources :reviews
  resources :exercises
  resources :users, excelpt: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root :to => "hw#hello_world"

  #Signing Up
  get '/signup', to: 'users#new'

  #Logging In
  
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
end
