# frozen_string_literal: true

Rails.application.routes.draw do
  get 'balances/edit'
  root 'pages#mainpage'
  get 'pages/about', as: 'about'
  get 'records/index', as: 'home'

  resources :records do
    resources :comments
  end

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  get 'lk', to: 'users#edit', as: 'edit_balance'
  patch 'lk', to: 'users#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
