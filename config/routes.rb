# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :gifts

  # login
  get '/auth/login'  => 'sessions#new', as: 'login'
  post '/auth/login' => 'sessions#create'
  get '/auth/logout' => 'sessions#destroy', as: 'logout'
end
