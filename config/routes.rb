Rails.application.routes.draw do
  
  get '/signup' => 'users#new'
  
  resources :users 
  resources :concerts

  resources :bands
  
  resources :venues do
    resources :concerts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
