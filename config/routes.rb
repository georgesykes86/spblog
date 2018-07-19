Rails.application.routes.draw do
  get 'sessions/new'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/directions', to: 'pages#directions'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :articles do
    resources :comments
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
