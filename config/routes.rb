Rails.application.routes.draw do
  
  #root_route
    root to: 'static#home'
    
    get '/auth/:provider/callback' => 'sessions#omniauth'

  #Signing Up 
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

  #Logging In

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

  #Specific Exercise Indices

    get 'exercises/bodyparts', to: 'exercises#bodyparts'
    get 'exercises/exercisegroup', to: 'exercises#exercisegroup'
    get 'exercises/equipment', to: 'exercises#equipment'

  #Reviews Nested Routes
 
  resources :exercises do
    resources :reviews  
  end
  
  resources :users, :workouts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
