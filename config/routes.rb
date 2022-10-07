# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  resources :properties, except: %i[create]
  resources :amenities, except: %i[create]


  post 'properties/new', to: 'properties#create'
  post 'amenities/new', to: 'amenities#create'
  post '/properties/:id/edit', to: 'properties#update'
  # get 'showproperty', to: 'properties#show'
  # post 'createproperty', to: 'properties#create' , as: 'create'
  # get 'new', to: 'properties#new'
end
