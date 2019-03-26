# frozen_string_literal: true

require 'sidekiq/web'
# routes
Rails.application.routes.draw do
  resources :posts
  resources :usuarios, as: :users, only: %i[update show]
  resources :friendships, only: %i[create update index]
  resources :notifications, only: %i[index update]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  post '/custom_sign_up', to: 'users/omniauth_callbacks#custom_sign_up'

  authenticated :user do
    root 'main#home'
  end

  unauthenticated :user do
    root 'main#unregistered'
  end

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
