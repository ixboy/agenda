Rails.application.routes.draw do
  get 'addresses/new'
  post 'address', to: 'addresses#create', as: 'address'
  root 'contacts#index'

  get 'cadastro', to: 'users#new'
  get 'entrar',   to: 'sessions#new'
  post 'entrar',  to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  get 'entrar', to: 'sessions#new'

  resources :users
  resources :contacts do
    resources :addresses
  end
  resources :sessions, only: %i[new create destroy]
end
