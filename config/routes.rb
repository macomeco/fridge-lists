Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :users, only: [:show, :new, :create, :edit, :update, :themeset]
  resources :tags, only: [:create, :destroy, :update]
  resources :lists, only: [:create, :destroy, :update]
  resources :things, only: [:create, :destroy, :update]

end
