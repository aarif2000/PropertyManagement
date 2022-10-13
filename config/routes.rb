# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'profile', to: 'home#profile' 
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  resources :properties, except: %i[create]
  resources :bookings
  resources :checkout, only: [:create]

  post 'properties/new', to: 'properties#create'
  post '/properties/:id/edit', to: 'properties#update'
  post 'booking_path', to: 'bookings#create'
  post '/charge/:id', to: 'home#charge'
   get 'checkout_path/:id', to: 'booking#payment' 

   get 'current_property', to: "properties#current_property"
end
