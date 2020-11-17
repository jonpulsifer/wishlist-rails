# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  resources :users

  get '/available' => 'gifts#available', as: 'available_gifts'
  get '/claimed' => 'gifts#claimed', as: 'claimed_gifts'
  resources :gifts

  # login
  get '/auth/login'  => 'sessions#new', as: 'login'
  post '/auth/login' => 'sessions#create'
  get '/auth/logout' => 'sessions#destroy', as: 'logout'

  get '/services/ping', to: "services#ping"
end
