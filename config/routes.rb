Rails.application.routes.draw do  
  
  ### gossips ###
  resources :gossips

  ### users ###
  resources :users

  ## static pages ##
  get '/', to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get '/welcome/:name', to: 'welcome#show'


end
