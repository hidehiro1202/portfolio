Rails.application.routes.draw do
  get 'profils/new'
  get 'sessions/new'
  #トップページにアクセス
  root 'pages#index'
  
  resources :users
  resources :mypage
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
