Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }

  root 'home#index'

  resources :users do
    resources :bio, only: [:edit]
  end

  resources :games do
    resources :signups, only: [:create, :destroy]
    resources :requests, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :donate
  resources :about
  resources :comments
  resources :map, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :new, :create, :show, :destroy]
      resources :users
      resources :comments, only: [:index, :new, :create]
      resources :nearmegames
    end
  end

  resources :conversations do
    resources :messages
  end

end
