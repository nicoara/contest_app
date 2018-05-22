Rails.application.routes.draw do
  root "dancers#index"

  resources :dancer_partners, only: [:new, :create, :show]
  resources :international_couples, only: [:index]
  resources :devoted_dancers, only: [:index]

  get   '/data',      to: 'data#index'
  get   '/dancer_with_most_competitions', to: 'data#dancer_with_most_competitions'

  resources :couples
  resources :dancers
  resources :entries
  resources :participants
  resources :competitions
  resources :age_sections
  resources :divisions
end
