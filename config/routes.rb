Rails.application.routes.draw do
  root "dancers#index"

  resources :dancer_partners, only: [:new, :create, :show]
  resources :international_couples, only: [:index]
  resources :devoted_dancers, only: [:index]
  resources :dancer_most_competitions, only: [:index]
  resources :dancer_most_divisions, only: [:index]
  resources :dancer_most_age_sections, only: [:index]
  resources :data, only: [:index]
  resources :couples
  resources :dancers
  resources :entries
  resources :participants
  resources :competitions
  resources :age_sections
  resources :divisions
end
