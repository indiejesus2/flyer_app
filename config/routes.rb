Rails.application.routes.draw do
  
  get '/' => 'concerts#index'
  get '/signup' => 'users#new'
  get '/login', to: 'sessions#new'
  get 'auth/google_oauth2/callback', to: 'sessions#google'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :users 
  resources :sessions
  resources :concerts

  resources :bands do 
    resources :concerts
  end
  
  resources :venues do
    resources :concerts
  end

end
