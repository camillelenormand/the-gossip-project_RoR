Rails.application.routes.draw do  
  
  ### gossips ###
  resources :gossips do
    resources :comments
  end

  ## likes ##
  resources :likes, only: [:new, :create, :destroy]

  ### sessions ###
  resources :sessions, only: [:new, :create, :destroy]

  ### users ###
  resources :users

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
