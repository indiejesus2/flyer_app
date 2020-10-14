Rails.application.routes.draw do
  
  get '/signup' => 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :users 
  resources :concerts

  resources :bands do 
    resources :concerts
  end
  
  resources :venues do
    resources :concerts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
