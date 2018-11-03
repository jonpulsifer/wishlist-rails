Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  # users
  resources :users
  resources :gifts
  resources :wishlists
  
	# login
	get '/auth/login'  => 'sessions#new', as: 'login'
	post '/auth/login' => 'sessions#create'
  get '/auth/logout' => 'sessions#destroy', as: 'logout'
  
  # wishlists
  get '/' => 'users#index'
end
