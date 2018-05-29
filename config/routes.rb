Rails.application.routes.draw do
  root "dancers#index"

  resources :dancer_partners, only: [:new, :create, :show]
  resources :international_couples, only: [:index]
  resources :devoted_dancers, only: [:index]
  resources :dancers_most_competitions, only: [:index]
  resources :dancer_most_divisions, only: [:index]
  resources :dancer_most_age_sections, only: [:index]
  resources :avg_yearly_couple_competitions, only: [:index]
  resources :country_most_couples_competitions, only: [:index]
  resources :competition_most_earnings, only: [:index]
  resources :data, only: [:index]
  resources :couples
  resources :dancers
  resources :entries
  resources :participants
  resources :competitions
  resources :age_sections
  resources :divisions
end
