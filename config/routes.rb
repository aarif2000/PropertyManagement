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
  resources :properties



  post 'properties/new', to: 'properties#create'
  post '/properties/:id/edit', to: 'properties#update'


  get 'admin_booking_status', to: "bookings#admin_booking_status"
  get 'booking_checkout', to: "bookings#booking_checkout"
  get 'cancel_url', to: "bookings#cancel_url"
  get 'ipn_url', to: "bookings#ipn_url"
  get 'return_url', to: "bookings#return_url"
  get '/users/:id/subscription_index', to: "bookings#subscription_index", as: :users_subscriptions
end
