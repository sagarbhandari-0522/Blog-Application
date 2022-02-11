# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
  end
  resources :users
  resources :dashboards
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboards#index'
end
