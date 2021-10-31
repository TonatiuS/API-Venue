Rails.application.routes.draw do
  resources :history_tickets
  resources :client_users
  resources :stand_users
  resources :admin_users
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do 
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  devise_for :users
  resources :tickets
  resources :ticket_types
  resources :events
  resources :date_venues
  resources :places
  resources :states
  resources :cupons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
