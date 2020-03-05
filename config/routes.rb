Rails.application.routes.draw do
  get 'profils/new'
  get 'sessions/new'
  #トップページにアクセス
  root 'pages#index'
  
  resources :users
  resources :mypages
  resources :profils
  resources :spots
  resources :areas 
  
  get '/spots/:id', to: 'spots#show'
  post '/spots/:id', to: 'spots#show'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete  '/favorites', to: 'favorites#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
