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
  
  get'/users/:id', to: 'users#show'
  
  get'/mypages/:id', to: 'mypages#show'
  
  get '/spots/:id', to: 'spots#show'
  post '/spots/:id', to: 'spots#show'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete  '/favorites', to: 'favorites#destroy'
  
  get 'clears/index'
  post '/clears', to: 'clears#create'
  delete  '/clears', to: 'clears#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
