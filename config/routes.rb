Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :welfares, only: [:index, :new, :create]
  resources :groups, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  
  root 'sessions#index'
end
