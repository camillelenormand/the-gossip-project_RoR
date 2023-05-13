Rails.application.routes.draw do  

  root 'gossips#index'
  
  ### gossips ###
  resources :gossips do
    resources :comments
  end

  resources :gossips do
    member do
      post 'like'
      delete 'unlike'
    end
  end

  ## likes ##
  resources :likes, only: [:new, :create, :destroy]

  ### sessions ###
  resources :sessions, only: [:new, :create, :destroy]

  ### users ###
  resources :users, only: [:new, :create, :show]

  ### cities ###
  resources :cities, only: [:show, :index]

  ## static pages ##
  get 'welcome', to: 'sessions#welcome'
  get '/', to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get '/welcome/:name', to: 'welcome#show'


end
