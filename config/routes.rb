Rails.application.routes.draw do
  get 'lists/create'
  get 'lists/destroy'
  get 'lists/update'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :tags, only: [:create, :destroy, :update]
  resources :lists, only: [:create, :destroy, :update]

end
