Rails.application.routes.draw do
  resource :session, only: [:new,:create,:destroy]
  # get 'sessions/new'
  resources :users
  resources :subs
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/index'
  # get 'users/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
