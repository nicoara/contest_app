Rails.application.routes.draw do
  resources :entries
  resources :participants
  resources :competitions
  resources :agesections
  resources :divisions
  root "dancers#index"

  resources :couples
  resources :dancers
end
