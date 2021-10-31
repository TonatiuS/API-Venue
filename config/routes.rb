Rails.application.routes.draw do
  resources :tickets
  resources :ticket_types
  resources :events
  resources :date_venues
  resources :places
  resources :states
  resources :cupons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
