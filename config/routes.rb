# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  mount Quilt::Engine, at: '/ui'

  root to: 'users#index'
  resources :users

  resources :gifts
  get '/available', to: 'gifts#available', as: 'available_gifts'
  get '/claimed', to: 'gifts#claimed', as: 'claimed_gifts'

  resources :posts, except: ['show', 'update', 'destroy']

  # login
  get '/auth/login',  to: 'sessions#new', as: 'login'
  post '/auth/login', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy', as: 'logout'

  get '/services/ping', to: "services#ping"
end
