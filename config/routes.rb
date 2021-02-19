Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/create'
  # get 'cocktails/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  root to: 'cocktails#index'
end
