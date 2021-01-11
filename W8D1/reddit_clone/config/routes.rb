Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create:POST'
  resources :users
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/index'
  # get 'users/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
