Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :welfares, only: [:index, :new, :create]
  resources :groups, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  resources :contributors, only: [:index, :new, :create, :show]
  
  root 'sessions#index'

  get 'menu', to: 'sessions#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
