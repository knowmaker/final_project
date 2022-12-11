Rails.application.routes.draw do
  root 'pages#mainpage'
  get 'pages/about'
  get 'records/index', as: 'home'
  #get 'about' => 'pages#about', as: 'about'
  #resources :posts do
    #resources :comments
    #end
  resources :records do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
