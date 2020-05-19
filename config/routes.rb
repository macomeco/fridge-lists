Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #phone
  #get 'tag_phone', to: 'tags#new'

  resources :users, only: [:show,:create, :edit, :update]
  resources :tags, only: [:show,:create, :destroy, :update]
  resources :lists, only: [:show,:create, :destroy, :update]
  resources :things, only: [:show,:create, :destroy, :update]

end
