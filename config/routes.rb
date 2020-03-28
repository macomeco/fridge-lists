Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resource :users, only: [:index,:show,:new,:create,:edit,:update]
end
