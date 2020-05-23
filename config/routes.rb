Rails.application.routes.draw do
 root to: 'toppages#index'
 #get 'toppages/index'
  #devise_for :users
 
#  get 'login', to: 'devise/sessions#new'
#  post 'login', to: 'devise/sessions#create'
#  delete 'logout', to: 'devise/sessions#destroy'
  
  #phone
  #get 'tag_phone', to: 'tags#new'
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :users, only: [:show,:create, :edit, :update]
  resources :tags, only: [:show,:create, :destroy, :update]
  resources :lists, only: [:show,:create, :destroy, :update]
  resources :things, only: [:show,:create, :destroy, :update]

end
