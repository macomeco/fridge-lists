Rails.application.routes.draw do
 root to: 'toppages#index'
  #devise_for :users
#  get 'login', to: 'devise/sessions#new'
#  post 'login', to: 'devise/sessions#create'
#  delete 'logout', to: 'devise/sessions#destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show, :create, :edit, :update]
  resources :tags, only: [:show, :create, :destroy, :update]
  resources :lists, only: [:show, :create, :destroy, :update]
  resources :things, only: [:create, :update, :destroy]
end
