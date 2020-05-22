Rails.application.routes.draw do

  devise_for :users
  root to: 'toppages#index'
  
  get 'login', to: 'devise/sessions#new'
  post 'login', to: 'devise/sessions#create'
  delete 'logout', to: 'devise/sessions#destroy'
  
  #phone
  #get 'tag_phone', to: 'tags#new'

  resources :users, only: [:show,:create, :edit, :update]
  resources :tags, only: [:show,:create, :destroy, :update]
  resources :lists, only: [:show,:create, :destroy, :update]
  resources :things, only: [:show,:create, :destroy, :update]

end
