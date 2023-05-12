Rails.application.routes.draw do  

  root 'sessions#welcome'

  ### devise ###
  devise_for :users
  
  ### gossips ###
  resources :gossips do
    resources :comments
  end

  ## likes ##
  resources :likes, only: [:new, :create, :destroy]

  ### sessions ###
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'
  
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'

  ### users ###
  resources :users, only: [:new, :create, :show]

  ### comments ###
  resources :comments

  ### cities ###
  resources :cities

  ## static pages ##
  get '/', to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get '/welcome/:name', to: 'welcome#show'


end
