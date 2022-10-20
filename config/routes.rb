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
  post '/charge/:id', to: 'bookings#charge'
  get 'checkout_path/:id', to: 'bookings#payment', as: 'pay'
  get '/confirm_booking/:id', to: 'bookings#confirm_booking'
  get 'current_property', to: "properties#current_property"
  get 'new/:id', to: 'bill#new', as: 'new'
  get 'show_bill/:id', to: 'bill#show', as: 'show_bill'
  post 'bill', to: 'bill#create'
  post 'share/:id', to: 'properties#share', as: 'share'
  get 'update_status', to: 'properties#update_status'

   
end
