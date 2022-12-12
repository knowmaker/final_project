# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#mainpage'
  get 'pages/about', as: 'about'
  get 'records/index', as: 'home'
  # get 'about' => 'pages#about', as: 'about'
  resources :records do
    resources :comments
  end

  resources :users
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
