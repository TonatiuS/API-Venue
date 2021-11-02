Rails.application.routes.draw do
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do 
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  namespace :api do

    devise_for :users
    resources :history_tickets
    resources :client_users
    resources :stand_users
    resources :admin_users  
    resources :tickets
    resources :ticket_types
    resources :events
    resources :date_venues
    resources :places
    resources :states
    resources :cupons
    resource  :sessions, only: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
