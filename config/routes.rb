Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :contacts
  resources :users, only: [:new, :create]
  root 'contacts#index'
end